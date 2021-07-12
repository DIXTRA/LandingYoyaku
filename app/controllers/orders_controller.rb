class OrdersController < ApplicationController
    def new
      @order = Order.new
    end

    def create
      @order = Order.new(order_params)

      if @order.save
        flash[:success] = t('flash.order.success')
        OrderMailer.with(order: @order).new_order_email.deliver_later
      else
        flash[:error] =  t('flash.order.error_html')
      end
      redirect_to root_path
    end

    private

    def order_params
      params.require(:order).permit(:name, :email, :phone, :comments)
    end
end
