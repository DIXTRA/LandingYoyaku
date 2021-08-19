class OrdersController < ApplicationController
    def new
      @order = Order.new
      respond_to do |format|
        format.js { render "home/javascript" }
      end
    end

    def create
      @order = Order.new(order_params)

      if @order.save
        flash[:success] = t('flash.order.success')
        OrderMailer.with(order: @order).new_order_email.deliver_later
        redirect_to root_path and return
      else
        flash[:error] =  t('flash.order.error_html')
      end
      respond_to do |format|
        format.js { render "home/javascript.js.erb" }
      end
    end

    private

    def order_params
      params.require(:order).permit(:name, :email, :phone, :comments)
    end
end
