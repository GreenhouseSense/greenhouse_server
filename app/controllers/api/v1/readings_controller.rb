class Api::V1::ReadingsController < ApplicationController
  before_action :test_greenhouse_service_token, only: [:add]  
  before_action :test_greenhouse_service_token_expiration, only: [:add] 
  before_action :test_user_token, except: [:add]  
  before_action :test_token_expiration, except: [:add]

  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#  
  def add
    add_reading_params
    new_reading = Reading.new(greenhouse_id: @gserv[0].greenhouse.id,
                              air_humidity: add_reading_params[:air_humidity], 
                              air_temperature: add_reading_params[:air_temperature], 
                              soil_moisture: add_reading_params[:soil_moisture], 
                              red_light_intensity: add_reading_params[:red_light_intensity], 
                              blue_light_intensity: add_reading_params[:blue_light_intensity], 
                              green_light_intensity: add_reading_params[:green_light_intensity], 
                              outside_light_intensity: add_reading_params[:outside_light_intensity], 
                              fan_status: add_reading_params[:fan_status], 
                              roof_door_position: add_reading_params[:roof_door_position], 
                              front_door_status: add_reading_params[:front_door_status], 
                              wattering_status: add_reading_params[:wattering_status])
    if new_reading.save
      render json: {status: 'SUCCESS', message: 'Added new reading', data: new_reading.as_json(:except => [:greenhouse_id])}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Reading not added', data: new_reading.errors}, status: :unprocessable_entity
    end
  end


  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#
  def get_last
    # GET Method to retreive the last readings added
    get_reading_params_last
    if Reading.count == 0
      render json: {status: 'ERROR', message: 'No readings found', data: 0},status: :ok
    else
      if((Greenhouse.where('id = ?',params[:greenhouse_id]).where('user_id = ?', @user[0].id)).count == 1)
        last_reading = Reading.where('greenhouse_id = ?',params[:greenhouse_id]).order("created_at").last
        render json: {status: 'SUCCESS', message: 'Loaded readings', data: last_reading},status: :ok
      else
        render json: {status: 'ERROR', message: 'You have not permission to access this greenhouse', data:0},status: :unprocessable_entity
      end
    end
  end


  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#
  def get_weeks
    # GET Method to retreive the readings added in last X weeks
    get_reading_params_weeks
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
    
    if((Greenhouse.where('id = ?',params[:greenhouse_id]).where('user_id = ?', @user[0].id)).count == 1)  
      week_days = weeks * 7
      weeks_readings = Reading.where('greenhouse_id = ?',params[:greenhouse_id]).where('created_at >= ?', Time.zone.now - week_days.days)
      if weeks_readings == 0
        msg_str = "No records for last #{weeks} weeks"      
      else
        msg_str = "Loaded readings from last #{weeks} weeks"
      end
      
      render json: {status: 'SUCCESS', message: msg_str, data: weeks_readings},status: :ok
      return true
    else
      render json: {status: 'ERROR', message: 'You have not permission to access this greenhouse', data:0},status: :unprocessable_entity
    end
  end



  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#
  def get_months
    # GET Method to retreive the decision added in last X months
    get_reading_params_months
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

    months_readings = Reading.where('greenhouse_id = ?',params[:greenhouse_id]).where('created_at >= ?', Time.zone.now - months.months) 
    if months_readings == 0
        msg_str = "No readings for last #{months} months"      
      else
        msg_str = "Loaded readings from last #{months} months"
      end
      render json: {status: 'SUCCESS', message: msg_str, data: months_readings},status: :ok
    return true
  end



  #--------------------------------------------------------------------------------#
  #--------------------------------------------------------------------------------#
  def get_years
    # GET Method to retreive the decision added in last X years
    get_reading_params_years
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

    years_readings = Reading.where('greenhouse_id = ?',params[:greenhouse_id]).where('created_at >= ?', Time.zone.now - years.years) 
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
      params.require(:air_humidity, :air_temperature, :soil_moisture, 
                    :red_light_intensity, :blue_light_intensity, 
                    :green_light_intensity, :outside_light_intensity, 
                    :fan_status, :roof_door_position, :front_door_status, 
                    :wattering_status, :atoken)
    end

    def get_reading_params_last
      params.require(:atoken,:greenhouse_id)
    end
    def get_reading_params_weeks
      params.require([:atoken,:weeks,:greenhouse_id])
    end

    def get_reading_params_months
      params.require([:atoken,:months,:greenhouse_id])
    end

    def get_reading_params_years
      params.require([:atoken,:years,:greenhouse_id])
    end




end
