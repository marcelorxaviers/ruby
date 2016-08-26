class Api::MealsController < ApplicationController

  respond_to :json
  before_action :set_meal, only: [:show, :update, :destroy]
  before_action :token_auth, only: [:destroy]

  def index
    return unauthorized unless token_auth
    filters = @tkuser.admin? ? filter_params : filter_params.merge(user_id: @tkuser.id)
    render json: { meals: Meal.filter(filters).map(&:jsonify) }
  end

  def show
    return unauthorized unless token_auth
    render json: { meal: @meal.jsonify }
  end

  def update
    return unauthorized unless token_auth
    return forbidden("You can only update your meals.") unless allowed?
    return render json: { meal: @meal.jsonify } if @meal.update(meal_params)
    forbidden(@meal.parsed_errors)
  end

  def create
    return unauthorized unless token_auth
    meal = Meal.new(meal_params)
    return forbidden unless @tkuser.admin? || @tkuser.id == meal.user_id
    return render json: { meal: meal.jsonify } if meal.save
    forbidden(meal.parsed_errors)
  end

  def destroy
    @meal.destroy if allowed?
    head :no_content
  end

  private

  def meal_params
    params.require(:meal).permit(:day, :time, :note, :user_id, :calories)
  end

  def filter_params
    params.permit(:fromDay, :toDay, :fromHour, :toHour)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def allowed?
    @tkuser.present? && @tkuser.admin? || @meal.user_id == @tkuser.id
  end

end