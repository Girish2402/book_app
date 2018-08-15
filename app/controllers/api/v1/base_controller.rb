class Api::V1::BaseController < ActionController::API
	before_action :authenticate!
	private
	def authenticate!
		token = request.headers[:HTTP_AUTH_TOKEN] || params[:auth_token]
		if token
			payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
			authenticated = payload && (payload["token"]==Rails.application.secrets.auth_token && payload['expires_at'] > Time.now.to_i)
		end
		render(json: {success: false}, status: :unauthorized) if !authenticated
	end
end