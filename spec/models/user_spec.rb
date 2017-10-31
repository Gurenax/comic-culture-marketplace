# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a new user' do
    before do
      @new_user = User.create!(email: 'glenn@example.com', password: 'password')
      @created_user = User.find_by(email: @new_user.email)
    end

    it 'will create a record in the Users table' do
      expect(User.find(@new_user.id).present?).to be_truthy
    end

    it 'will create the record with the correct email address' do
      expect(@created_user.email).to eq(@new_user.email)
    end

    it 'will ensure that the password is encrypted' do
      expect(@created_user.encrypted_password).to_not eq(@new_user.password)
    end
  end
end
