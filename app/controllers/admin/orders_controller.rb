class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.all
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_orders_path, notice: "delete order successfully"
  end
end