user = User.create(:name => "Anusha", :role => "teacher", :email => "anusha@memphis.edu" , :password => "hellohello")
user = User.create(:name => "Maria", :role => "teacher", :email => "maria@memphis.edu" , :password => "hellohello")  
user = User.create(:name => "T", :role => "student", :email => "tsdhlwal@memphis.edu" , :password => "software") 
user = User.create(:name => "Aaron", :role => "student", :email => "tmrshall@memphis.edu" , :password => "software") 
user = User.create(:name => "Austin", :role => "student", :email => "prynlds3@memphis.edu" , :password => "software") 
user = User.create(:name => "Brandon", :role => "student", :email => "bhopper1@memphis.edu" , :password => "software") 
user = User.create(:name => "Cameron", :role => "student", :email => "cwood2@memphis.edu" , :password => "software") 
user = User.create(:name => "Cannon", :role => "student", :email => "wcmoyer@memphis.edu" , :password => "software") 
user = User.create(:name => "Chris", :role => "student", :email => "cdhall3@memphis.edu" , :password => "software") 
user = User.create(:name => "Cletus", :role => "student", :email => "chhatten@memphis.edu" , :password => "software") 
user = User.create(:name => "Cooper", :role => "student", :email => "cbjones5@memphis.edu" , :password => "software") 
user = User.create(:name => "Daniel", :role => "student", :email => "wdwood@memphis.edu" , :password => "software") 
user = User.create(:name => "David", :role => "student", :email => "depucktt@memphis.edu" , :password => "software") 
user = User.create(:name => "Denzel", :role => "student", :email => "djyoung1@memphis.edu" , :password => "software") 
user = User.create(:name => "Drew", :role => "student", :email => "dtstbnow@memphis.edu" , :password => "software") 
user = User.create(:name => "Ed", :role => "student", :email => "prinsiii@memphis.edu" , :password => "software") 
user = User.create(:name => "Enyil", :role => "student", :email => "pdllvlle@memphis.edu" , :password => "software") 
user = User.create(:name => "Eric", :role => "student", :email => "egoddard@memphis.edu" , :password => "software") 
user = User.create(:name => "Gregory", :role => "student", :email => "gllwrnce@memphis.edu" , :password => "software") 
user = User.create(:name => "Herve", :role => "student", :email => "haniglo@memphis.edu" , :password => "software") 
user = User.create(:name => "Jeremy", :role => "student", :email => "jqthomas@memphis.edu" , :password => "software") 
user = User.create(:name => "Jonathan", :role => "student", :email => "jwood5@memphis.edu" , :password => "software") 



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
