class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string  :street_number
      t.string  :street_number_suffix
      t.string  :street_name
      t.string  :street_type
      t.integer :street_direction_id
      t.integer :address_type_id
      t.string  :block
      t.string  :city
      t.string  :postal_code
      t.integer :region_id
      t.integer :country_id
      t.string  :crossstreet
      t.decimal :latitude,  :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
