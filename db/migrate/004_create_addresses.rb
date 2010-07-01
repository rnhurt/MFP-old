class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :person_id
      t.integer :role_id
      t.integer :location_id
      t.string  :phone_number
      t.string  :email_address

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
