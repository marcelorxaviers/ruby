class RulesController < ApplicationController
  def new
    @rule = Rule.new()
  end

  def create
    Rule.create(rule_params)
    redirect_to root_path
  end

  def update
    @rule = Rule.find(params[:id])
    @rule.update(rule_params)
    render json: @rule
  end

  def destroy
    Rule.find(params[:id]).destroy
    redirect_to root_path
  end

  def index
    @rules = Rule.query(params[:query])
    respond_to do |format|
      format.html
      format.json { render json: @rules }
    end
  end

  private

  def rule_params
    params.require(:rule).permit(:from_domain, :to_domain)
  end
end
