class AddStatusIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :status_id, :integer
  end
end
