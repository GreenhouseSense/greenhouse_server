class Api::V1::ReadingsController < ApplicationController
  def add
    new_reading = Reading.new(add_reading_params)
    if new_reading.save
      render json: {status: 'SUCCESS', message: 'Added new reading', data: new_reading}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Reading not added', data: new_reading.errors}, status: :unprocessable_entity
    end
  end

  def get_last
    # GET Method to retreive the last readings added
    if Reading.count.to_i = 0
      render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
    else
      last_reading = Reading.order("created_at").last
      render json: {status: 'SUCCESS', message: 'Loaded readings', data: last_reading},status: :ok
    end
  end

  def get_weeks
    # GET Method to retreive the readings added in last X weeks
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

    if Reading.count. == 0
      render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
      return true
    end
      
    week_days = weeks * 7
    weeks_readings = Reading.where('created_at >= ?', Time.zone.now - week_days.days) 
    if weeks_readings == 0
      msg_str = "No records for last #{weeks} weeks"      
    else
      msg_str = "Loaded readings from last #{weeks} weeks"
    end
    render json: {status: 'SUCCESS', message: msg_str, data: weeks_readings},status: :ok
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

    if Reading.count == 0
      render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
      return true
    end

    months_readings = Reading.where('created_at >= ?', Time.zone.now - months.months) 
    if months_readings == 0
        msg_str = "No readings for last #{months} months"      
      else
        msg_str = "Loaded readings from last #{months} months"
      end
      render json: {status: 'SUCCESS', message: msg_str, data: months_readings},status: :ok
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

    if Reading.count == 0
      render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
      return true
    end

    years_readings = Reading.where('created_at >= ?', Time.zone.now - years.years) 
    if years_readings == 0
      msg_str = "No readings for last #{years} years"      
    else
      msg_str = "Loaded readings from last #{years} years"
    end
    render json: {status: 'SUCCESS', message: msg_str, data: years_readings},status: :ok
    return true
  end


  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def add_reading_params      
      params.permit(:air_humidity, :air_temperature, :soil_moisture, 
                    :red_light_intensity, :blue_light_intensity, 
                    :green_light_intensity, :outside_light_intensity, 
                    :fan_status, :roof_door_position, :front_door_status, 
                    :wattering_status)
    end

end
