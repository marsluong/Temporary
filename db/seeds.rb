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
