class AddGreenhouseToDecisions < ActiveRecord::Migration[5.1]
  def change
    add_reference :decisions, :greenhouse, foreign_key: true
  end
end
