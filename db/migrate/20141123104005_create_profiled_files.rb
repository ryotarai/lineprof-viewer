class CreateProfiledFiles < ActiveRecord::Migration
  def change
    create_table :profiled_files do |t|
      t.references :profile, index: true
      t.string :path

      t.timestamps
    end
  end
end
