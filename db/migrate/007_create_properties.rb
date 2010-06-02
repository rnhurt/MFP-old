class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string  :category_id
      t.integer :value
      t.string  :description

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
