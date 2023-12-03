# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  body       :text
#  word_count :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  writer_id  :integer
#
class Submission < ApplicationRecord
  belongs_to :writer, required: true, class_name: "Writer", foreign_key: "writer_id", counter_cache: true
end
