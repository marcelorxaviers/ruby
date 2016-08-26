require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) {  User.create!( email:"some@user.com", password:"123qweasd", password_confirmation: "123qweasd", role: :admin ) }

  it 'signs in' do
    post user_session_path, { user: { email: user.email, password: user.password } }
    expect(response).to have_http_status(200)
    user_hash = JSON.parse(response.body)
    expect(user_hash['email']).to eq user.email
  end

  it 'creates a user with the given params' do
      email = "new@user.com"
      post api_users_path(user.id), { "user": { "email": email, "password": "123qweasd" } }
      expect(response).to have_http_status(200)
      expect(User.last.email).to include email
    end

  context 'signed in' do

    before(:each) do
      post user_session_path, { user: { email: user.email, password: user.password } }
      @auth_header = { 'HTTP_AUTHORIZATION' => "token='#{JSON.parse(response.body)['token']}', email='#{user.email}'" }
    end

    it 'responds with users index' do
      get api_users_path, nil, @auth_header
      expect(response).to have_http_status(200)
      expect(response.body).to include user.email
    end

    it 'responds with user available roles' do
      get api_users_roles_path, nil, @auth_header
      expect(response).to have_http_status(200)
      expect(response.body).to include user.role
    end

    it 'creates a user with the given params' do
      email = 'new@user.com'
      role = 'manager'
      post api_users_path, { 'user': { 'email': email, 'password': '123qweasd', 'role': role } }, @auth_header
      expect(response).to have_http_status(200)
      expect(User.last.email).to eq email
      expect(User.last.role).to eq role
    end

    it 'updates user with the given params (PATCH)' do
      new_name = 'My name'
      patch api_user_path(user.id), { 'user': { 'name': new_name } }, @auth_header
      expect(response).to have_http_status(200)
      expect(user.reload.name).to eq new_name
    end

    it 'updates user with the given params (PUT)' do
      new_name = 'A name'
      put api_user_path(user.id), { 'user': { 'name': new_name } }, @auth_header
      expect(response).to have_http_status(200)
      expect(user.reload.name).to eq new_name
    end

    it 'deletes user' do
      deletable_user = User.create!(email: 'another@user.com', password: '123qweasd')
      delete api_user_path(deletable_user), nil, @auth_header
      expect(response).to have_http_status(204)
      expect(User.where(id: deletable_user.id).first).not_to be
    end

  end

end
