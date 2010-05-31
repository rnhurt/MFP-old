class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string  :street_number
      t.string  :street_name
      t.string  :block
      t.string  :city
      t.string  :state
      t.string  :postal_code
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
