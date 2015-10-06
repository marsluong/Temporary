class StudentTest < ActiveRecord::Base
  has_many :student_answers
  has_many :multiple_choice_answers, -> { where(:question_type =>  "multiple_choice")}, :class_name => "StudentAnswer"
  

  has_many :multiple_choice_questions, :through => :multiple_choice_answers, :foreign_key => :question_id
 
  accepts_nested_attributes_for :multiple_choice_questions
 
  belongs_to :test
end
