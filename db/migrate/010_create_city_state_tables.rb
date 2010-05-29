class CreateCityStateTables < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.string :abbr
      t.string :country
      t.string :state_type

      t.timestamps
    end

    create_table :cities do |t|
      t.integer :state_id
      t.string  :name
      t.integer :gnis_id
      t.float   :latitude
      t.float   :longitude
      t.integer :population_2000

      t.timestamps
    end

  end

  def self.down
    drop_table :states, :cities
  end
end
