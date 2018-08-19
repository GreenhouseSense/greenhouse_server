class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.float :air_humidity
      t.float :air_temperature
      t.float :soil_moisture
      t.float :red_light_intensity
      t.float :blue_light_intensity
      t.float :green_light_intensity
      t.float :outside_light_intensity
      t.boolean :fan_status
      t.float :roof_door_position
      t.boolean :front_door_status
      t.boolean :wattering_status

      t.timestamps
    end
  end
end
