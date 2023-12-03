# == Schema Information
#
# Table name: writers
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  word_count_goal        :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_writers_on_email                 (email) UNIQUE
#  index_writers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Writer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
