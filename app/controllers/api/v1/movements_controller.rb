class Api::V1::MovementsController < ApiController

    def create
        params_j = params[:movements]

        movements = params_j.map do |movement|            
            {        
                account_id: movement[:account_id],
                quantity: movement[:quantity],
                description: movement[:description],
                type_movement_id: movement[:type_movement_id],
                created_at: Time.new,
                updated_at: Time.new
            }
        end
        
        movements.map do |movement|
            if validate_movement(movement[:account_id], movement[:type_movement_id], movement[:quantity])
                type_movement(movement[:account_id], movement[:type_movement_id], movement[:quantity])
                Movement.upsert_all(movements)
                render json: movements
            else
                render json: "El movimiento no es válido"
            end
        end
    end

    private

        def validate_movement(account, type, quantity)
            account = Account.find(account)
            if account.type_account_id == 1                
                if type == 1
                    quantity > 1000 ? false : true
                elsif type == 2
                    true
                end
            elsif account.type_account_id == 2
                if type == 1
                    account.total - quantity < 0 ? false : true
                elsif type == 2
                    true
                end
            end
        end

        def type_movement(account, type, quantity)
            account = Account.find(account)
            type == 1 ? new_total = account.total - quantity : new_total = account.total + quantity
            account.update(total: new_total)
        end
end