class ApplicationController < ActionController::API
	acts_as_token_authentication_handler_for User

	private

    def after_successful_token_authentication
      renew_authentication_token!
    end
end
