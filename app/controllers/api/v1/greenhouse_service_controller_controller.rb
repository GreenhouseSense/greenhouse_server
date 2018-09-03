class Api::V1::GreenhouseServiceControllerController < ApplicationController
before_action  :test_greenhouse_service_token, only: [:logout]	

def login
		params.permit(:email, :password)
		gserv = GreenhouseService.where(email: params[:email]).first
		gserv.update(authentication_token: nil)
		if gserv&.valid_password?(params[:password])
			render json: gserv.as_json(only:[:email, :authentication_token]), status: :created
		else
			head(:unauthorized)
		end
	end

	def logout
		#user = User.where(authentication_token: params[:atoken])
		@gserv.update(authentication_token: nil)
		render json: {status: 'SUCCESS', message: 'GreenhouseService logged out', data: 0},status: :ok
	end

	def new_user
	end

	protected
	def test_greenhouse
		super
	end

end
