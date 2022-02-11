class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.decimal :current_balance, default: 2
      t.decimal :low_balance, default: 1
      t.string :payment_method
      t.string :card_number
      t.string :cvc
      t.string :card_name
      t.integer :valid_month, default: 0
      t.integer :valid_year, default: 0
      t.boolean :active, default: true
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
