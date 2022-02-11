class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :company
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :apartment
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
