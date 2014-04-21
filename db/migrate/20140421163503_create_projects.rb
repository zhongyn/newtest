class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :belong_to_unit
      t.integer :bugget

      t.references :unit, index: true
      
      t.timestamps
    end
  end
end
