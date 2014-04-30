class AddProjectCountToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :project_count, :integer
  end
end
