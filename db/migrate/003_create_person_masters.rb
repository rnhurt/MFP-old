class CreatePersonMasters < ActiveRecord::Migration
  def self.up
    create_table :person_masters do |t|
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :person_masters
  end
end
