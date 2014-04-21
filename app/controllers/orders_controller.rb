class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_products, only: [:new, :edit]
  before_action :check_user, except: [:index]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.line_items.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
	
    respond_to do |format|
      if @order.save
      puts "patatita"
      	OrderMailer.order_created(@order, @current_user).deliver
        format.html { redirect_to @order, notice: 'order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:status, :payment_method, :ship_address, :ship_city, :client_name, line_items_attributes: [:product_id, :quantity, :price, :_destroy, :id])
    end
    
    def set_products
    	@products = Product.all
    end
# para comprobar si esta logueado y devolverle adonde estaba   
    def check_users
    	unless current_user
    		redirect_to new_session_path
#    		cookies[:return_to]= url_for(params)
    	end
    end
    
end
