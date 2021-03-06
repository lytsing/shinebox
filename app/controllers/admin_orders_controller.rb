class AdminOrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_order!

  def index
    @orders = []
    @orders = CourseOrder.where(number: params[:number]) unless params[:number].blank?
  end

  def pay
    @order = CourseOrder.find params[:id]
    @order.pay! if @order.pending?
    redirect_to admin_orders_path(number: @order.number)
  end

  private
  def authorize_order!
    authorize! :confirm_pay, CourseOrder
  end
end
