class Api::V1::AccountsController < ApiController

    def index
        
        accounts = Account.all

        accounts_j = accounts.map do |account|
        {
            customer: account.customer.name,
            type_account: account.type_account.name
        }
        end

        render json: accounts_j
    end
end