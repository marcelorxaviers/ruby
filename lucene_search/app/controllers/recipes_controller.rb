require 'json'

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    render json: Recipe.all
  end

  # GET /search
  # GET /search.json
  def search
    entries = Recipe.lucene_search(lucene_query)
    recipes = entries.map { |e| { name: e.name, content: e.content } }
    render json: { hits: recipes.count,  documents: recipes }
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    render json: @recipe
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      head :no_content
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy

    head :no_content
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :content)
    end

    def lucene_query
      JSON(params.first.first)["query"]
    end
end
