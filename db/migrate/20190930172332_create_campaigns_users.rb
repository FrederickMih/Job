class CreateCampaignsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns_users do |t|
      t.belongs_to :profile, foreign_key: true, index: true
      t.belongs_to :campaign, foreign_key: true, index: true

      t.timestamps
    end
  end
end
