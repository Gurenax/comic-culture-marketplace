# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  first_name    :string
#  last_name     :string
#  image_data    :string
#  date_of_birth :date
#  short_bio     :text
#  superpowers   :string
#  favourites    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
end
