user = User.create(:name => "Teacher", :role => "teacher", :email => "teacher@example.com" , :password => "hellohello"
                  )  
user = User.create(:name => "Student", :role => "student", :email => "student@example.com" , :password => "hellohello"
                   ) 
user = User.create(:name => "Alice", :role => "student", :email => "alice@example.com" , :password => "hellohello"
                   )
user = User.create(:name => "Bob", :role => "student", :email => "bob@example.com" , :password => "hellohello"
                   )

test = Test.create(:test_name => "Prelecture Quiz Class 1", :status => "deactivated" )
test = Test.create(:test_name => "Strategy Quiz 1", :status => "deactivated" )   
test = Test.create(:test_name => "Strategy Quiz 2", :status => "deactivated" )   
test = Test.create(:test_name => "Strategy Quiz 3", :status => "deactivated" )   
test = Test.create(:test_name => "Observer Quiz", :status => "deactivated" )
test = Test.create(:test_name => "End of class 1 Quiz", :status => "deactivated" )

test = Test.create(:test_name => "Prelecture Quiz Class 2", :status => "deactivated" )
test = Test.create(:test_name => "Adapter Quiz 1", :status => "deactivated" )
test = Test.create(:test_name => "Adapter Quiz 2", :status => "deactivated" )
test = Test.create(:test_name => "Facade Quiz 1", :status => "deactivated" )
test = Test.create(:test_name => "Facade Quiz 2", :status => "deactivated" )
test = Test.create(:test_name => "End of class 2 Quiz", :status => "deactivated" )

mcq = MultipleChoiceQuestion.create(:test_id => "1", :description => "The process by which one object can acquire the properties of another object", :option_1 => "Inheritance", :option_2 => "Encapsulation", :option_3 => "Polymorphism", :option_4 => "Data hiding", :answer => "Inheritance" )
mcq = MultipleChoiceQuestion.create(:test_id => "1", :description => "Here is a method definition:
op(param1: Type1, param2: Type2): Return_Type1
Which of the following has a different signature?
", :option_1 => "op(param1: Type1, param2: Type2) : Return_Type1", :option_2 => "op(param1: Type1, param2: Type2) : Return_Type2
", :option_3 => "op(param1: Type1, param2: Type2) : Return_Type2", :option_4 => "op(param1: Type1, param2: Type1) : Return_Type1", :answer => "op(param1: Type1, param2: Type1) : Return_Type1" )
