class Api::V1::TypeMovementsController < ApiController

    def index
        render json: TypeMovement.all
    end
end