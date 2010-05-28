class CreatePersonmasters < ActiveRecord::Migration
  def self.up
    create_table :personmasters do |t|
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :personmasters
  end
end
