class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
  end

  def autocomplete_student_name
    term = params[:term]
    students = User.where("lower(name) LIKE '%#{term}%'").order(:name)
    render :json => students.map { |student| {:id => student.id, :label => "#{student.name}", :value => student.name} }
  end

  def search 
    @student_response = StudentAnswer.where(question_type: "descriptive", question_id: params[:question_id], student_test_id: StudentTest.where(test_id: params[:test_id].to_i, user_id: params[:student_id]))
    
    if @student_response.present?
      @student_response = "#{User.find(params[:student_id]).name} "+"response :  "+" <b> #{@student_response[0][:answer]} </b>"
    else
      if params[:student_id].present?
        @student_response ="<b> #{User.find(params[:student_id]).name} </b>"+" didn't attempt this question"
      else
        @student_response ="No student with name : "+" <b >#{params[:term]}</b>"
      end
    end

    redirect_to "/tests/#{params[:test_id]}?&report=true", :notice => @student_response
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.create(test_params)
    if @test.errors.present?
      flash.now[:fail] = I18n.t :fail, :scope => [:test, :create]
      render "new"
    else
      flash.now[:success] = I18n.t :success, :scope => [:test, :create]
      @test.status = "deactivated"
      @test.save
      redirect_to @test
    end
  end

  def show
    @multiple_choice_questions = MultipleChoiceQuestion.where(test_id: params[:id].to_i)
    @descriptive_questions = DescriptiveQuestion.where(test_id: params[:id].to_i)
    @total_questions = @multiple_choice_questions + @descriptive_questions
    if params[:report].present?
      @test.report = "true"      
      @total_questions.each do |tq|
        if tq.question_type == "multiple_choice"
          @answer = []
          tq.attempted_students_count = StudentTest.where(id: (StudentAnswer.where(question_id: tq.id, question_type: "multiple_choice").select(:student_test_id)), test_id: params[:id].to_i).count

          
          tq.correct_attempted_students_count = StudentTest.where(id: (StudentAnswer.where(question_id: tq.id, question_type: "multiple_choice", result: true).select(:student_test_id)), test_id: params[:id].to_i).count          
          correct_attempted_students = StudentTest.where(id: (StudentAnswer.where(question_id: tq.id, question_type: "multiple_choice", result: true).select(:student_test_id)), test_id: params[:id].to_i).select(:user_id)
          correct_attempted_students_answers = StudentAnswer.where(question_id: tq.id, result: true, student_test_id: StudentTest.where(test_id: params[:id].to_i).select(:id)).select(:answer)
          tq.correct_attempted_students_and_answers = correct_attempted_students.each_with_index.map  do |student,index|
            correct_attempted_students_answers.each_with_index do |answer,index|
              @answer[index] = answer.answer
            end
            {user_id: student.user_id, answer: @answer[index]}
          end
          
          tq.wrong_attempted_students_count = StudentTest.where(id: (StudentAnswer.where(question_id: tq.id, question_type: "multiple_choice", result: false).select(:student_test_id)), test_id: params[:id].to_i).count

          wrong_attempted_students = StudentTest.where(id: (StudentAnswer.where(question_id: tq.id, question_type: "multiple_choice", result: false).select(:student_test_id)), test_id: params[:id].to_i).select(:user_id)

          wrong_attempted_students_answers = StudentAnswer.where(question_id: tq.id, result: false, student_test_id: StudentTest.where(test_id: params[:id].to_i).select(:id)).select(:answer)
          tq.wrong_attempted_students_and_answers = wrong_attempted_students.each_with_index.map  do |student,index|
            wrong_attempted_students_answers.each_with_index do |answer,index|
              @answer[index] = answer.answer
            end
            {user_id: student.user_id, answer: @answer[index]}
          end

          if tq.option_1 == tq.answer and tq.correct_attempted_students_count != 0
            tq.option1_report = "#{tq.correct_attempted_students_count} Choose - Correct!"
            tq.option1_class = "correct_option"
          else
            @option_1_wrong_count = 0
            tq.wrong_attempted_students_and_answers.each do |temp|
              if MultipleChoiceQuestion.where(id: tq.id, test_id: tq.test_id, option_1: temp[:answer]).present?
                @option_1_wrong_count = @option_1_wrong_count+1
              end
            end 
            if @option_1_wrong_count != 0
              tq.option1_report = "#{@option_1_wrong_count} Choose - Incorrect!"
              tq.option1_class = "incorrect_option"
            end
          end
          
          if tq.option_2 == tq.answer and tq.correct_attempted_students_count != 0
            tq.option2_report = "#{tq.correct_attempted_students_count} Choose - Correct!"
            tq.option2_class = "correct_option"
          else 
            @option_2_wrong_count = 0
            tq.wrong_attempted_students_and_answers.each do |temp|
              if MultipleChoiceQuestion.where(id: tq.id, test_id: tq.test_id, option_2: temp[:answer]).present?
                @option_2_wrong_count = @option_2_wrong_count+1
              end
            end 
            if @option_2_wrong_count != 0
              tq.option2_report = "#{@option_2_wrong_count} Choose - Incorrect!"
              tq.option2_class = "incorrect_option"
            end
          end
          
          if tq.option_3 == tq.answer and tq.correct_attempted_students_count != 0
            tq.option3_report = "#{tq.correct_attempted_students_count} Choose - Correct!"
            tq.option3_class = "correct_option"
          else 
            @option_3_wrong_count = 0
            tq.wrong_attempted_students_and_answers.each do |temp|
              if MultipleChoiceQuestion.where(id: tq.id, test_id: tq.test_id, option_3: temp[:answer]).present?
                @option_3_wrong_count = @option_3_wrong_count+1
              end
            end 
            if @option_3_wrong_count != 0
              tq.option3_report = "#{@option_3_wrong_count} Choose - Incorrect!"
              tq.option3_class = "incorrect_option"
            end
          end
          
          if tq.option_4 == tq.answer and tq.correct_attempted_students_count != 0
            tq.option4_report = "#{tq.correct_attempted_students_count} Choose - Correct!"
            tq.option4_class = "correct_option"
          else 
            @option_4_wrong_count = 0
            tq.wrong_attempted_students_and_answers.each do |temp|
              if MultipleChoiceQuestion.where(id: tq.id, test_id: tq.test_id, option_4: temp[:answer]).present?
                @option_4_wrong_count = @option_4_wrong_count+1
              end
            end 
            if @option_4_wrong_count != 0
              tq.option4_report = "#{@option_4_wrong_count} Choose - Incorrect!"
              tq.option4_class = "incorrect_option"
            end
          end
          
        end
        if tq.question_type == "descriptive"
          @answer = []
          tq.attempted_students_count = StudentTest.where(id: (StudentAnswer.where(question_id: tq.id, question_type: "descriptive").select(:student_test_id)), test_id: params[:id].to_i).count
            
          attempted_students =   StudentTest.where(id: (StudentAnswer.where(question_id: tq.id, question_type: "descriptive").select(:student_test_id)), test_id: params[:id].to_i).select(:user_id)
          
          attempted_answers = StudentAnswer.where(question_type: "descriptive", question_id: tq.id, student_test_id: StudentTest.where(test_id: params[:id].to_i).select(:id)).select(:answer)

          tq.attempted_students_and_answers = attempted_students.each_with_index.map  do |student,index|
            attempted_answers.each_with_index do |answer,index|
              @answer[index] = answer.answer
            end
            {user_id: student.user_id, answer: @answer[index]}
          end
        end
      end
    end
    
    @total_questions.sort_by! {|u| u.created_at}
    @total_questions = @total_questions.paginate(page: params[:page], per_page:1)
  end
  
  def activate_test
    if Test.find_by_status("activated")
      flash[:notice] = "Please Deactivate Activated Test"
    else
      @test = Test.find(params[:test_id])
      @test.status = "activated"
      @test.save
      flash[:notice] = "Test Activated"      
    end
    redirect_to "/"
  end
