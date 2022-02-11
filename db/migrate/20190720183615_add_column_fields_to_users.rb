class AddColumnFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :country, :string
    add_column :users, :time_zone, :string
    add_column :users, :avatar, :string
  end
end
