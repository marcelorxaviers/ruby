require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do

    context 'expected calories per day ' do

      let(:user) { User.create( email:"new@user.com", password:"123qweasd", password_confirmation: "123qweasd", role: :admin ) }

      it "is valid when set to nil" do
        user.expected_calories = nil
        expect(user).to be_valid
      end

      it 'is valid when greater than or equal to zero' do
        user.expected_calories = 0
        expect(user).to be_valid
        expect(user.errors.empty?).to be
        user.expected_calories = 1
        expect(user).to be_valid
        expect(user.errors.empty?).to be
      end

      it "is invalid when lower than zero" do
        user.expected_calories = -1
        expect(user).to_not be_valid
        expect(user.errors.messages[:expected_calories]).to include('must be greater than or equal to 0')
      end

    end

  end

end