class AddAuthenticationTokenToGreenhouseService < ActiveRecord::Migration[5.1]
  def change
    add_column :greenhouse_services, :authentication_token, :string, limit: 30
    add_index :greenhouse_services, :authentication_token, unique: true
  end
end
