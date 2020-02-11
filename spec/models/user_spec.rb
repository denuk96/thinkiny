require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do

    it 'ensure email  is valid' do
      user = User.new(email: 'blablabla@mail.com')
      expect(user.valid?).to eq(false)
    end

    it 'ensure password is valid' do
      user = User.new(password: 'password', password_confirmation: 'password')
      expect(user.valid?).to eq(false)
    end

    it 'ensure user can be saved' do
      user = User.new(email: 'blablabla@mail.com', password: 'password', password_confirmation: 'password')
      expect(user.valid?).to eq(true)
      expect(user.save).to eq(true)
    end
  end
end
