class Api::V1::TypeAccountsController < ApiController

    def index
        render json: TypeAccount.all
    end
end