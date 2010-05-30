class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :person_id
      t.string  :type
      t.string  :location_id
      t.string  :phone_number
      t.string  :email_address

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end