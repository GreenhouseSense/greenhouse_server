class Api::V1::DecisionsController < ApplicationController
  before_action  :test_user_token
  before_action  :test_token_expiration
  def add
    puts "......."
    # POST Method to add a new decision registry on bd
    #new_decision = Decision.new(add_decision_params)
    add_decision_params
    new_decision = Decision.new(origin: add_decision_params[:origin], description: add_decision_params[:description], greenhouse_id: add_decision_params[:greenhouse_id])
    if new_decision.save
      render json: {status: 'SUCCESS', message: 'Added new decision', data: new_decision}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Decision not added', data: new_decision.errors}, status: :unprocessable_entity
    end
  end

  def get_last
    # GET Method to retreive the last decision added
    if Decision.count.to_i = 0
      render json: {status: 'ERROR', message: 'No decisions found', data: 0},status: :ok
    else
      last_decision = Decision.order("created_at").last
      render json: {status: 'SUCCESS', message: 'Loaded decision', data: last_decision},status: :ok
    end
  end

  def get_weeks
    # GET Method to retreive the decision added in last X weeks
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

    if Decision.count. == 0
      render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
      return true
    end
      
    week_days = weeks * 7
    weeks_decisions = Decision.where('created_at >= ?', Time.zone.now - week_days.days) 
    if weeks_decisions == 0
      msg_str = "No decisions for last #{weeks} weeks"      
    else
      msg_str = "Loaded decisions from last #{weeks} weeks"
    end
    render json: {status: 'SUCCESS', message: msg_str, data: weeks_decisions},status: :ok
    return true
  end

  def get_months
    # GET Method to retreive the decision added in last X months
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

    if Decision.count == 0
      render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
      return true
    end

    months_decisions = Decision.where('created_at >= ?', Time.zone.now - months.months) 
    if months_decisions == 0
        msg_str = "No decisions for last #{months} months"      
      else
        msg_str = "Loaded decisions from last #{months} months"
      end
      render json: {status: 'SUCCESS', message: msg_str, data: months_decisions},status: :ok
    return true
  end

  def get_years
    # GET Method to retreive the decision added in last X years
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

    if Decision.count == 0
      render json: {status: 'ERROR', message: 'No decisions found', data: 0},status: :ok
      return true
    end

    years_decisions = Decision.where('created_at >= ?', Time.zone.now - years.years) 
    if years_decisions == 0
      msg_str = "No decisions for last #{years} years"      
    else
      msg_str = "Loaded decisions from last #{years} years"
    end
    render json: {status: 'SUCCESS', message: msg_str, data: years_decisions},status: :ok
    return true
  end

  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def add_decision_params      
      params.permit(:origin, :description, :atoken, :greenhouse_id)
    end

end
