class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.timestamps
    end

    create_table :projects do |t|
    	t.belongs_to :status
    	t.timestamps
    end
  end
end
