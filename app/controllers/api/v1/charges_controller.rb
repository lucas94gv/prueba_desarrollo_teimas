class Api::V1::ChargesController < ApiController

    before_action :set_account, only: %i[ show ]

    def show
        render json: @account.movements.where(type_movement_id: 1)
    end

    private
        def set_account
            @account = Account.find(params[:id])
        end
end