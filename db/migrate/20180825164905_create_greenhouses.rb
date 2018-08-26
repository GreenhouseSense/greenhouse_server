class CreateGreenhouses < ActiveRecord::Migration[5.1]
  def change
    create_table :greenhouses do |t|
      t.string :location
      t.string :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
