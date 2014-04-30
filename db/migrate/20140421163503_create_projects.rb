class CreateProjects < ActiveRecord::Migration
  def change

    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :belong_to_unit
      t.integer :bugget
      t.belongs_to :unit      

      t.reference :status, index: true
      t.reference :units, index: true
      
      t.timestamps
    end

  end
end
