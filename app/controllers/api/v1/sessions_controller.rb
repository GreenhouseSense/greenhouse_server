class Api::V1::SessionsController < ApplicationController
	before_action  :test_user, only: [:logout]

	def login
		params.permit(:email, :password)
		user = User.where(email: params[:email]).first
		user.update(authentication_token: nil)
		if user&.valid_password?(params[:password])
			render json: user.as_json(only:[:email, :authentication_token]), status: :created
		else
			head(:unauthorized)
		end
	end

	def logout
		#user = User.where(authentication_token: params[:atoken])
		@user.update(authentication_token: nil)
		render json: {status: 'SUCCESS', message: 'User logged out', data: 0},status: :ok
	end

	def new_user
	end

	protected
	def test_user
		super
	end

end