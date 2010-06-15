class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :property_type_id
      t.decimal :value, :precision => 8, :scale => 2
      t.string  :description

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
