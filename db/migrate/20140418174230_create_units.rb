class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :manager
      t.text :notes
      t.integer :member_count
      t.timestamps
    end

    
  end
end
