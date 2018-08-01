class CreateDecisions < ActiveRecord::Migration[5.1]
  def change
    create_table :decisions do |t|
      t.text :description, :null => false
      t.text :origin, :null => false

      t.timestamps
    end
  end
end
