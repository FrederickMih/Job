class AddColumsSkillsToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :skills, :text
    add_column :profiles, :industry_expertise, :text
    add_column :profiles, :languages, :text
  end
end
