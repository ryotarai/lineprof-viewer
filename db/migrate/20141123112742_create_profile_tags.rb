class CreateProfileTags < ActiveRecord::Migration
  def change
    create_table :profile_tags do |t|
      t.string :key
      t.string :value
      t.references :profile, index: true

      t.timestamps
    end
  end
end
