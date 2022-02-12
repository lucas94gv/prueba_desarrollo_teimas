class ApiController < ApplicationController
    before_action :set_default_format
    skip_before_action :verify_authenticity_token
    before_action :authorize

    private
        def set_default_format
            request.format = :json
        end

        def authenticate
            authenticate_or_request_with_http_token do |token, options|
                Customer.find_by(token: token)
            end
        end

        def authorize            
            header = request.headers["Authorization"]
            unless Customer.find_by(token: header)
                unauthorized
            end            
        end

        def unauthorized
          head :unauthorized
        end
end