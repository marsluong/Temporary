class AddAttachmentImageToMultipleChoiceQuestions < ActiveRecord::Migration
  def self.up
    change_table :multiple_choice_questions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :multiple_choice_questions, :image
  end
end
