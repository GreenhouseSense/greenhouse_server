class Api::V1::DecisionsController < ApplicationController
  
	def index
		render json: {status: 'SUCCESS', message: 'Loaded decisions', data:'{lixo:lixo}', status: :ok }
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

end
