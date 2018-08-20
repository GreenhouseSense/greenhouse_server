class Api::V1::ActionsController < ApplicationController
  def add
  	puts "...."
  	new_action = Action.new(add_action_params)
  	if new_action.save
      render json: {status: 'SUCCESS', message: 'Added new action', data: new_action}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Action not added', data: new_action.errors}, status: :unprocessable_entity
    end
  end

  def get_all
  	actions = Action.all
  	if actions.count > 0
  		render json: {status: 'SUCCESS', message: 'Returning actions list', data:actions}, status: :ok 
     	return true  
    else
			render json: {status: 'ERROR', message:'No actions found', data:0}, status: :ok
		end
  end

  def get
  	 action = Action.find(params[:id])
     if action > 0
     	render json: {status: 'SUCCESS', message: 'Returning requested action description', data:action}, status: :ok 
     	return true
     else
     	msg_str = "No actions for id #{params[:id]}"
    	render json: {status: 'ERROR', message: msg_str, data:0}, status: :ok
     end
  end

  def update
  	action_edit = Action.find(params[:id])
  	if action_edit.update(update_params)
  		render json: {status: 'SUCCESS', message: 'Action edited', data: action_edit}, status: :ok 
  	else
  		render json: {status: 'ERROR', message: 'Action not edited', data: action_edit.errors}, status: :unprocessable_entity
  	end
  end

  def destroy
  	action = Action.find(params[:id])
  	action.destroy
  	render json: {status: 'SUCCESS', message: 'Action destroyed', data: action}, status: :ok 
  end


  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def add_action_params      
      params.permit(:description)
    end

    def update_params
  		params.require(:id).permit(:description)
		end

end
