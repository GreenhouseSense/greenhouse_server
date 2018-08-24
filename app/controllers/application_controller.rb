class ApplicationController < ActionController::API
	 def test_user
	 	puts '--------------'
	 	params.require('atoken')
		@user = User.where(authentication_token: params[:atoken])
		if @user.empty?#User.where(authentication_token: params[:atoken]).empty?
			render json: {status: 'ERROR', message: 'Token not valid', data: 0}, status: :unprocessable_entity
			return false
		else
			return @user
	 end
	end
end
