class AddAttachmentImageToDescriptiveQuestions < ActiveRecord::Migration
  def self.up
    change_table :descriptive_questions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :descriptive_questions, :image
  end
end
