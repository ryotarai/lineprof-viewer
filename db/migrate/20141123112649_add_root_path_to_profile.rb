class AddRootPathToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :root_path, :string
  end
end
