class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :pay, :edit, :buy, :update, :destroy]
  before_action :set_all_products, only: [:new, :edit]
  before_action :authenticate, only: [:new]

  def index
    @products = Product.available
    @changes = Machine.instance.changes
    @balance = Machine.instance.balance
  end

  def show
  end

  def new
    @product = Product.new
    @balance = Machine.instance.balance
  end

  def edit
    @errors = params[:errors]
  end

  def pay
  end

  def buy
    begin
      change = Machine.instance.process!(@product, payment_params)
      redirect_to products_url, notice: "Product was successfully bought. Change is: #{change}"
    rescue => e
      @errors = [e]
      render 'pay'
    end 
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to new_product_url }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to new_product_url }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { redirect_to edit_product_url(errors: @product.errors.full_messages.map{ |e| e }) }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id] || params[:product_id])
    end

    def set_all_products
      @products = Product.all
    end

    def product_params
      params.require(:product).permit(:id, :name, :price, :quantity)
    end

    def payment_params
      params.require(:money).require(:inserted)
    end

end
