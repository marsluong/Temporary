class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  
  validates :name, :presence => true
  validates :role, :presence => true

  def teacher?
    self.role == "teacher"
  end

  def student?
    self.role == "student"
  end
end
