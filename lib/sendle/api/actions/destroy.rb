module Sendle
  module Api
    module Actions
      module Destroy

        def destroy(id)
          raise Sendle::Api::Errors::MissingParams.new(['id']) if nullish?(id) 

          # request_params = rest_client_params
          # request_params[:method] = :get
          # request_params[:url] = url + '/' + id

          # process_show_response(request(request_params))
        end

        def self.included(base)
          base.extend(Sendle::Api::Sugars::Destroy)
        end

      end
    end
  end
end