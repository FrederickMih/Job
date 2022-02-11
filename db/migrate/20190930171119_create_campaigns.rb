class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :caller_number
      t.datetime :start_date
      t.integer :status, default: 0
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
