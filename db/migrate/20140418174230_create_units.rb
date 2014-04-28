class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :manager
      t.text :notes
      t.integer :member_count
      t.timestamps
    end

    create_table :projects do |t|
    	t.belongs_to :unit
    	t.timestamps
    end
  end
end
