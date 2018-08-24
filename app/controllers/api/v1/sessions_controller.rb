class Api::V1::SessionsController < ApplicationController

	def login
		user = User.where(email: params[:email]).first
		if user&.valid_password?(params[:password])
			render json: user.as_json(only:[:email, :authentication_token]), status: :created
		else
			head(:unauthorized)
		end
	end

	def logout
		user = User.where(authentication_token: params[:atoken]).first
		user.update_column(authentication_token: nil)
		render json: {status: 'SUCCESS', message: 'User logged out', data: 0},status: :ok
	end

	def new_user
	end

end