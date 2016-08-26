require 'rails_helper'

RSpec.describe Meal, type: :model do

  describe 'validations' do

    let(:user) { User.create(email: 'new@user.com', password: '123qweasd', role: :admin) }
    let(:meal) { Meal.create(day: Date.current, time: '12:00', calories: 10, user_id: user.id, note: 'Meat') }

    it 'is invalid when note is blank' do
      expect(meal).to be_valid
      meal.note = nil
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:note]).to include("can't be blank")
      meal.note = ''
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:note]).to include("can't be blank")
    end

    it 'is invalid when day is blank' do
      expect(meal).to be_valid
      meal.day = nil
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:day]).to include("can't be blank")
      meal.day = ''
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:day]).to include("can't be blank")
    end

    it "is invalid when day is not date (or isn't in date format)" do
      expect(meal).to be_valid
      meal.day = '2016'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:day]).to include("can't be blank")
      meal.day = '2016-08'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:day]).to include("can't be blank")
    end

    it 'is invalid when user_id is nil' do
      expect(meal).to be_valid
      meal.user_id = nil
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:user_id]).to include("can't be blank")
    end

    it 'is invalid when calories is set to nil' do
      expect(meal).to be_valid
      meal.calories = nil
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:calories]).to include("can't be blank")
    end

    it 'is invalid when calories is not a number' do
      expect(meal).to be_valid
      meal.calories = 'not a number'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:calories]).to include("is not a number")
    end

    it 'is invalid when time is not in 24 Hours format' do
      expect(meal).to be_valid
      meal.time = '12pm'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:time]).to include("only 24 Hours time is allowed.")
      meal.time = '1'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:time]).to include("only 24 Hours time is allowed.")
      meal.time = '1:'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:time]).to include("only 24 Hours time is allowed.")
      meal.time = '1:0'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:time]).to include("only 24 Hours time is allowed.")
      meal.time = '25:00'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:time]).to include("only 24 Hours time is allowed.")
      meal.time = '23:60'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:time]).to include("only 24 Hours time is allowed.")
      meal.time = '23:600'
      expect(meal).not_to be_valid
      expect(meal.errors.messages[:time]).to include("only 24 Hours time is allowed.")
    end
  end
end
