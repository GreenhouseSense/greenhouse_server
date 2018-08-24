class Api::V1::SessionsController < ApplicationController

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
		params.require('atoken')
		user = User.where(authentication_token: params[:atoken])
		if user.empty?
			render json: {status: 'ERROR', message: 'Token not valid', data: 0}, status: :unprocessable_entity
			return true
		else
			user.update(authentication_token: nil)
			render json: {status: 'SUCCESS', message: 'User logged out', data: 0},status: :ok
			return true
		end
	end

	def new_user
	end

end