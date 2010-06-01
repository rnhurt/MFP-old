class CreateOfficers < ActiveRecord::Migration
  def self.up
    create_table :officers do |t|
      t.string  :given_name
      t.string  :family_name
      t.string  :badge
      
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :officers
  end
end
