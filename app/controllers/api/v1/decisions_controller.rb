class Api::V1::DecisionsController < ApplicationController
  def add
    # POST Method to add a new decision registry on bd
    new_decision = Decision.new(add_decision_params)
    if new_decision.save
      render json: {status: 'SUCCESS', message: 'Added new decision', data: new_decision}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Decision not added', data: new_decision.errors}, status: :unprocessable_entity
    end
  end

  def get_last
    # GET Method to retreive the last decision added
    last_decision = Decision.order("created_at").last
    render json: {status: 'SUCCESS', message: 'Loaded decisions', data: last_decision},status: :ok
  end

  def get_weeks
    # GET Method to retreive the decision added in last X weeks
    weeks = params[:weeks].to_i
    if weeks > 0
      week_days = weeks * 7
      weeks_decisions = Decision.where('created_at >= ?', Time.zone.now - week_days.days) 
      if weeks_decisions == 0
        msg_str = "No records for last #{weeks} weeks"      
      else
        msg_str = "Loaded decisions from last #{weeks} weeks"
      end
      render json: {status: 'SUCCESS', message: msg_str, data: weeks_decisions},status: :ok
    else
      render json: {status: 'SUCCESS', message: "Weeks argument must be a integer higher than 0", data: 0},status: :ok
    end
  end

  def get_months
    # GET Method to retreive the decision added in last X months
    months = params[:months].to_i
    if months > 0
      months_decisions = Decision.where('created_at >= ?', Time.zone.now - months.months) 
      if months_decisions == 0
        msg_str = "No records for last #{months} months"      
      else
        msg_str = "Loaded decisions from last #{months} months"
      end
      render json: {status: 'SUCCESS', message: msg_str, data: months_decisions},status: :ok
    else
      render json: {status: 'SUCCESS', message: "Month argument must be a integer higher than 0", data: 0},status: :ok
    end
  end

  def get_years
    # GET Method to retreive the decision added in last X years
    years = params[:years].to_i
    if years > 0
      years_decisions = Decision.where('created_at >= ?', Time.zone.now - 1.years) 
      if years_decisions == 0
        msg_str = "No records for last #{years} years"      
      else
        msg_str = "Loaded decisions from last #{years} years"
      end
      render json: {status: 'SUCCESS', message: msg_str, data: years_decisions},status: :ok
    else
      render json: {status: 'SUCCESS', message: "Years argument must be a integer higher than 0", data: 0},status: :ok
    end
  end

  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def add_decision_params      
      params.permit(:origin, :description)
    end

end
