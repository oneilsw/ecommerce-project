class OrdersController < ApplicationController

    def index
        orders = Order.all
        render json: orders
    end 

    def show
        order = Order.find(params[:id])
        render json: order
    end 

    def create
        order = Order.create(order_params)

        if order.valid?
            render json: order
        else 
            render json: {error: "You done fucked up"}
        end 
    end 

    def update 
        order = Order.find(params[:id])
        order.update(order_params)

        if order.valid?
            render json: order
        else 
            render json: {error: "This update did not work"}
        end 
    end

    private 

    def order_params
        params.permit(:user_id, :paid)
    end 
end
