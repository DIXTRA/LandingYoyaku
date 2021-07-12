class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]

    mail(from:"majomdos@gmail.com", to: "maria.montes@dixtra.com", subject: "Consulta de YOYAKU!")
  end
end
