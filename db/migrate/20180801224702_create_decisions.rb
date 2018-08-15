class CreateDecisions < ActiveRecord::Migration[5.1]
  def change
    create_table :decisions do |t|
      t.string :description, :null => false
      t.string :origin, :null => false

      t.timestamps
    end
  end
end
