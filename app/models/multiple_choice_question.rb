class MultipleChoiceQuestion < ActiveRecord::Base

  attr_accessor :answer_caught
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
