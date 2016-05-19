class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :selectedItems
  skip_before_action :verify_authenticity_token, only: [:addItem]

  def selectedItems
    @selectedItems
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @items = Item.all
  end

  # GET /orders/new
  def new
    # selectedItems
    # Rails.logger.debug("@selectedItems: #{@selectedItems}")
    @order = Order.new
    @menu = Menu.all
  end

  def addItem
    # local = []
    # if params[:actions] == "add"
    #   #Rails.logger.debug("inside if")
    #   item = {:menu_id => params[:menu_id], :quantity => params[:quantity]}
    #   Rails.logger.debug("item: #{item}")
    #   local.push(item)
    #   @selectedItems.push(item)
    #   Rails.logger.debug("local: #{local}")
    #   Rails.logger.debug("@selectedItems: #{@selectedItems}")
    # else
    #   #Rails.logger.debug("inside else")
    # end

    @selectedItems = JSON.parse(params[:selectedItems])
    Rails.logger.debug("@selectedItems: #{@selectedItems}")

    # @selectedItems.each do |selectedItem| {
    #   item = Item.new
    #   item.menu_id = selectedItem[:menu_id]
    #   item.quantity = selectedItem[:quantity]
    #   item.orders_id = Order.last.id + 1
    #   item.save
    # }

  end

  # GET /orders/1/edit
  def edit
    @menu = Menu.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

    # @selectedItems.each do |selectedItem|
    #   item = Item.new
    #   item.menu = selectedItem.id
    #   item.quantity = selectedItems.quantity
    #   item.order = @order.id
    #   item.save
    # end

    #@selectedItems = JSON.parse(params[:selectedItems])
    Rails.logger.debug("@selectedItems in create: #{@selectedItems}")
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
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
      params.require(:order).permit(:customer_id, :order_detail)
    end
end
