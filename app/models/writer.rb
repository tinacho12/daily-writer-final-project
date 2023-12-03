# == Schema Information
#
# Table name: writers
#
#  id              :integer          not null, primary key
#  word_count_goal :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Writer < ApplicationRecord
end
