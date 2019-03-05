class ProductMailer < ApplicationMailer
	def send_notify_after_creating_product(product)
		@product = product
		mail(from: 'productCompany@xyz.com', to: 'client@gmail.com', subject: 'Thu nghiem gui mail')
	end
end