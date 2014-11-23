class CreateProfileRecords < ActiveRecord::Migration
  def change
    create_table :profile_records do |t|
      t.references :profiled_file, index: true
      t.integer :line
      t.integer :wall
      t.integer :cpu
      t.integer :calls
      t.integer :allocations

      t.timestamps
    end
  end
end
