class Api::V1::CustomersController < ApiController
    before_action :set_customer, only: %i[ show ]

    def index
        render json: Customer.all
    end

    def show
        render json: {
            id: @customer.id,
            name: @customer.name,
            surnames: @customer.surnames,
            token: @customer.token
        }
    end

    private
        def set_customer
            @customer = Customer.find(params[:id])
        end
end