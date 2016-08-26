require 'rails_helper'

RSpec.describe "Meals", type: :request do

  let(:user) { User.create(email: 'admin@user.com', password: '123qweasd', role: :admin) }
  let!(:meal) { Meal.create!(day: Date.current, time: '12:00', calories: 10, user_id: user.id, note: 'Test meal') }

  before(:each) do
    post user_session_path, { user: { email: user.email, password: user.password } }
    @auth_header = { 'HTTP_AUTHORIZATION' => "token='#{JSON.parse(response.body)['token']}', email='#{user.email}'" }
  end

  it 'responds with meals index' do
    get api_meals_path, nil, @auth_header
    expect(response).to have_http_status(200)
    expect(response.body).to include meal.note
  end

  it 'creates meal with given params' do
  	new_meal_note = 'New meal'
  	meal_hash = { meal: { day: Date.current, time: '12:00', calories: 10, user_id: user.id, note: new_meal_note } }
    post api_meals_path, meal_hash, @auth_header
    expect(response).to have_http_status(200)
    expect(response.body).to include new_meal_note
  end

  it 'shows the requested meal' do
    get api_meal_path(meal), nil, @auth_header
    expect(response).to have_http_status(200)
    expect(response.body).to include meal.note
  end

  it 'updates the given meal (PATCH)' do
  	new_note = 'New note'
    patch api_meal_path(meal), { meal: { note: new_note } }, @auth_header
    expect(response).to have_http_status(200)
    expect(meal.reload.note).to eq new_note
  end

  it 'updates the given meal (PUT)' do
  	new_new_note = 'New new note'
    put api_meal_path(meal), { meal: { note: new_new_note } }, @auth_header
    expect(response).to have_http_status(200)
    expect(meal.reload.note).to eq new_new_note
  end

  it 'deletes given meal' do
  	new_new_note = 'New new note'
    delete api_meal_path(meal), nil, @auth_header
    expect(response).to have_http_status(204)
    expect(Meal.where(id: meal.id).first).not_to be
  end

end
