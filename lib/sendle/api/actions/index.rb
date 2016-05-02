module Sendle
  module Api
    module Actions
      module Index

        def index(params = {})
          check_for_missing_credentials if include_credentials?
          validate_index_request!(params) 

          request_params = rest_client_params
          request_params[:method] = :get
          request_params[:url] = url
          request_params[:headers][:params] = params unless params.empty?

          process_index_response(request(request_params))
        end

        def self.included(base)
          base.extend(Sendle::Api::Sugars::Index)
        end

      end
    end
  end
end