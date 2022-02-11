class CreateCompaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :compaigns do |t|
      t.string :name
      t.string :caller_number
      t.datetime :start_date
      t.integer :status, default: 0
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
