class CreateProjects < ActiveRecord::Migration
  def change

    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :belong_to_unit
      t.integer :bugget
      t.belongs_to :unit      

      #t.reference :status, index: true
      #t.reference :units, index: true
      
      add_column :projects, :status_id, :integer
      add_index :projects, :status_id
      #add_column :statuses, :project_count, :integer

      t.timestamps
    end

  end
end
