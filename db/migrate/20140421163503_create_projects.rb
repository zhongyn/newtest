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
      t.belongs_to :status

      #add_column :statuses, :project_count, :integer

      t.timestamps
    end
      add_index :projects, :status_id

  end
end
