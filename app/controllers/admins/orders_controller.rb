class Admins::OrdersController < ApplicationController
	def show
	end

	def update

	end

	def index
   		 @orders = Order.all
	end

end
