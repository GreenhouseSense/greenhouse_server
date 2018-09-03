class AddGreenhouseToGreenhouseServices < ActiveRecord::Migration[5.1]
  def change
    add_reference :greenhouses, :greenhouse_service, foreign_key: true
  end
end
