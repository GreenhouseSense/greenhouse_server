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
    # GET Method to retreive the last decision added
    last_reading = Reading.order("created_at").last
    render json: {status: 'SUCCESS', message: 'Loaded readings', data: last_reading},status: :ok
  end

  def get_weeks
  end

  def get_months
  end

  def get_years
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
