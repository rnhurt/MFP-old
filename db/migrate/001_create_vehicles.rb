class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string  :vin
      t.integer :vehicle_color_id
      t.integer :vehicle_make_id
      t.integer :vehicle_model_id
      t.string  :reg_number
      t.string  :reg_state
      t.integer :year
      t.text    :description

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
