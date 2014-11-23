class AddMetricsToProfiledFile < ActiveRecord::Migration
  def change
    add_column :profiled_files, :total_wall_time, :integer
    add_column :profiled_files, :child_wall_time, :integer
    add_column :profiled_files, :exclusive_wall_time, :integer
    add_column :profiled_files, :total_cpu_time, :integer
    add_column :profiled_files, :child_cpu_time, :integer
    add_column :profiled_files, :exclusive_cpu_time, :integer
    add_column :profiled_files, :allocations, :integer
  end
end
