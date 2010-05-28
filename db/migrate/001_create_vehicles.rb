class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string  :vin
      t.string  :color
      t.string  :makecode
      t.string  :modelcode
      t.string  :reg_number
      t.string  :reg_state
      t.integer :year

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
