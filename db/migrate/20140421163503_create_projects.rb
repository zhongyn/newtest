class CreateProjects < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.timestamps
    end

    create_table :status do |t|
      t.string :name
      t. timestamps
    end

    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :belong_to_unit
      t.integer :bugget
      t.belongs_to :unit      

      t.reference :status, index: true
      
      t.timestamps
    end

  end
end
