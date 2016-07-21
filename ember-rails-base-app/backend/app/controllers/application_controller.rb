class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :normalize_params, if: :devise_controller?
  after_action :respond_with_current_token, if: :devise_controller?

  protected

  def token_auth
    auth = header_params
    @tkuser = User.find_by_email(auth[:email])
    return false if @tkuser.blank?
    return false if !Devise.secure_compare(@tkuser.current_token, auth[:token])
    sign_in(@tkuser, store: false) || true
  end

  private

  def header_params
    auth = request.headers.find { |e| e[0] == "HTTP_AUTHORIZATION" }.try(:last)
    email = /email="(.+)"/.match(auth).try(:captures).try(:first)
    token = /token="(.+)",/.match(auth).try(:captures).try(:first)
    { email: email, token: token }
  end

  def normalize_params
    if params[:user].present?
      params.merge!(params[:user])
      params.delete(:user)
    end
  end

  def respond_with_current_token
    if response.status < 400 && current_user.present?
      email = current_user.email
      token = current_user.current_token
      response.body = { token: token,
                        email: email,
                        user: current_user.jsonify }.to_json
    end
  end

end