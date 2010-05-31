class CreateInvolvements < ActiveRecord::Migration
  def self.up
    create_table :involvements do |t|
      t.string  :type
      t.integer :property_id
      t.integer :location_id
      t.integer :incident_id
      t.integer :person_id
      t.integer :vehicle_id
      t.integer :role_id

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :involvements
  end
end
