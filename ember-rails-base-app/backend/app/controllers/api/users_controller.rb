class Api::UsersController < ApplicationController

   respond_to :json
   before_action :set_user, only: [:show, :update, :destroy]
   before_action :token_auth, only: [:create, :destroy]

  # curl -XGET -v -H 'AUTHORIZATION: token="aH0WjWFuSeohqGTa5LCybQ", email="regular@user.com" 'http://localhost:3000/api/users/
  def index
    return unauthorized unless token_auth
    return forbidden if @tkuser.regular?
    render json: { users: User.all.collect(&:jsonify) }
  end

  def show
    return unauthorized unless token_auth
    render json: { user: @user.jsonify }
  end

  def roles
    render json: User.roles.keys
  end

  def create
    user = User.new(user_params)
    user.role = params[:user][:role] if allowed?
    return render json: { user: user.jsonify } if user.save
    forbidden(user.parsed_errors)
  end

  def update
    return unauthorized unless token_auth
    return forbidden("You can only update yourself.") if @tkuser.regular? && (@user != @tkuser)
    @user.role = params[:user][:role] unless @tkuser.regular?
    return render json: { user: @user.jsonify } if @user.update(user_params)
    forbidden(@user.parsed_errors)
  end

  def destroy
    @user.destroy if @user == @tkuser || allowed?
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def allowed?
    @tkuser && !@tkuser.regular?
  end

  def forbidden(error = "The action is forbidden for #{@tkuser.email}.")
    render json: { errors: error }, status: :forbidden
  end

  def unauthorized
    render json: { error: { message: 'Unauthorized.' } }, status: :unauthorized
  end

end