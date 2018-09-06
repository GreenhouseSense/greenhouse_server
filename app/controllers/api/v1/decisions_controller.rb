class Api::V1::DecisionsController < ApplicationController
  before_action :test_greenhouse_service_token, only: [:add]  
  before_action :test_greenhouse_service_token_expiration, only: [:add] 
  before_action :test_user_token, except: [:add]  
  before_action :test_token_expiration, except: [:add]


  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#  
  def add
    # POST Method to add a new decision registry on bd
    add_decision_params
    new_decision = Decision.new(origin: add_decision_params[:origin], description: add_decision_params[:description], greenhouse_id: @gserv[0].greenhouse.id)
    if new_decision.save
      render json: {status: 'SUCCESS', message: 'Added new decision', data: new_decision.as_json(:except => [:greenhouse_id])}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Reading not added', data: new_decision.errors}, status: :unprocessable_entity
    end
  end




#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
  def get_last
    # GET Method to retreive the last readings added
    get_decision_params_last
    # if Reading.count == 0
    #   render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
    # else
      if((Greenhouse.where('id = ?',params[:greenhouse_id]).where('user_id = ?', @user[0].id)).count == 1)
        last_decison = Decision.where('greenhouse_id = ?',params[:greenhouse_id]).order("created_at").last
        if last_decison.nil? || last_decison.count == 0
          msg_str = "No decisions found"      
        else
          msg_str = "Loaded last decisions"
        end
        render json: {status: 'SUCCESS', message: msg_str, data: last_decison},status: :ok
        return true
      else
        render json: {status: 'ERROR', message: 'You have not permission to access this greenhouse data', data:0},status: :unprocessable_entity
        return false
      end
    # end
  end








  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#
  def get_weeks
    # GET Method to retreive the readings added in last X weeks
    get_decision_params_weeks
    begin
      weeks = params[:weeks].to_i
    rescue 
      render json: {status: 'ERROR', message: "Weeks argument must be a integer", data: 0},status: :ok
      return true
    end

    if weeks <= 0
      render json: {status: 'ERROR', message: "Weeks argument must be a integer higher than 0", data: 0},status: :ok
      return true
    end

    if((Greenhouse.where('id = ?',params[:greenhouse_id]).where('user_id = ?', @user[0].id)).count == 1)  
      # if Reading.count. == 0
      #   render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
      #   return true
      # end
      week_days = weeks * 7
      weeks_decisionss = Decision.where('greenhouse_id = ?',params[:greenhouse_id]).where('created_at >= ?', Time.zone.now - week_days.days)
      
      if weeks_decisionss.nil? || weeks_decisionss.count == 0
        msg_str = "No decisions for last #{weeks} weeks"      
      else
        msg_str = "Loaded decisions from last #{weeks} weeks"
      end
      
      render json: {status: 'SUCCESS', message: msg_str, data: weeks_decisionss},status: :ok
      return true
    else
      render json: {status: 'ERROR', message: 'You have not permission to access this greenhouse', data:0},status: :unprocessable_entity
      return false
    end
  end




  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#
  def get_months
    # GET Method to retreive the decision added in last X months
    get_decision_params_months
    begin
      months = params[:months].to_i
    rescue 
      render json: {status: 'ERROR', message: "Months argument must be a integer", data: 0},status: :ok
      return true
    end

    if months <= 0
      render json: {status: 'ERROR', message: "Months argument must be a integer higher than 0", data: 0},status: :ok
      return true
    end

    if((Greenhouse.where('id = ?',params[:greenhouse_id]).where('user_id = ?', @user[0].id)).count == 1)  
      # if Reading.count == 0
      #   render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
      #   return true
      # end

      months_decisions = Decision.where('greenhouse_id = ?',params[:greenhouse_id]).where('created_at >= ?', Time.zone.now - months.months) 
      if months_decisions.nil? || months_decisions.count == 0
          msg_str = "No decision for last #{months} months"      
        else
          msg_str = "Loaded decisions from last #{months} months"
        end
        render json: {status: 'SUCCESS', message: msg_str, data: months_decisions},status: :ok
      return true
    else
      render json: {status: 'ERROR', message: 'You have not permission to access this greenhouse', data:0},status: :unprocessable_entity
      return false
    end
  end

  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#
  def get_years
    # GET Method to retreive the decision added in last X years
    get_decision_params_years
    begin
      years = params[:years].to_i
    rescue 
      render json: {status: 'ERROR', message: "Years argument must be a integer", data: 0},status: :ok
      return true
    end

    if years <= 0
      render json: {status: 'ERROR', message: "Years argument must be a integer higher than 0", data: 0},status: :ok
      return true
    end

    if((Greenhouse.where('id = ?',params[:greenhouse_id]).where('user_id = ?', @user[0].id)).count == 1)  
      # if Reading.count == 0
      #   render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
      #   return true
      # end

      years_decisions = Reading.where('greenhouse_id = ?',params[:greenhouse_id]).where('created_at >= ?', Time.zone.now - years.years) 
      if years_decisions.nil? || years_decisions.count == 0
        msg_str = "No decisions for last #{years} years"      
      else
        msg_str = "Loaded decisions from last #{years} years"
      end
      render json: {status: 'SUCCESS', message: msg_str, data: years_decisions},status: :ok
      return true
    else
      render json: {status: 'ERROR', message: 'You have not permission to access this greenhouse', data:0},status: :unprocessable_entity
      return false
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def add_decision_params      
    params.require([:origin, :description, :atoken, :greenhouse_id])
  end

  def get_decision_params_last
    params.require([:atoken,:greenhouse_id])
  end
  
  def get_decision_params_weeks
    params.require([:atoken,:weeks,:greenhouse_id])
  end

  def get_decision_params_months
    params.require([:atoken,:months,:greenhouse_id])
  end

  def get_decision_params_years
    params.require([:atoken,:years,:greenhouse_id])
  end


end
