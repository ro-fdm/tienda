class OrderMailer < ActionMailer::Base
  default from: "tienda_aspgems@orders.com"
  
  def order_created(order, user)
  	@order = order
  	@user = user
  	mail(to: @user.email,  subject:"Nuevo Pedido Tienda online")
  end
end
