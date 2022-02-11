class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :title
      t.text :bio
      t.string :country
      t.decimal :cost
      t.string :picture_url

      t.timestamps
    end
  end
end
