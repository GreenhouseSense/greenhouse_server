class ApplicationController < ActionController::API
	 def test_user_token
	 	puts '--------------'
	 	params.require('atoken')
		@user = User.where(authentication_token: params[:atoken])
		if @user.empty?#User.where(authentication_token: params[:atoken]).empty?
			render json: {status: 'ERROR', message: 'Token not valid', data: 0}, status: :unprocessable_entity
			return false
		else
			return true
		end
	 end

	 def test_token_expiration
	 	puts '-------------------'
	 	# update_time = @user[0]['updated_at'].to_time
	 	# puts 'current-1min:'
	 	# puts Time.now - 1.hour
	 	# puts 'update: '
	 	# puts update_time
	 	# if update_time < (Time.now - 1.hour)
	 	update_date = @user[0]['updated_at'].to_date
	 	puts 'current-10days:'
	 	puts Date.current - 10.days
	 	puts 'update: '
	 	puts update_date
	 	if update_date < (Date.current - 10.days)
			@user.update(authentication_token: nil)
			render json: {status: 'ERROR', message: 'Expired token', data: 0}, status: :unprocessable_entity
			return false
		else
			return true
	 end
	end

end
