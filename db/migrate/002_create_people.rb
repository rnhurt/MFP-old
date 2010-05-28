class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :personmaster_id
      t.string  :first_name
      t.string  :middle_name
      t.string  :last_name
      t.string  :ssn
      t.date    :dob
      t.string  :race
      t.string  :gender
      t.integer :height
      t.integer :weight
      t.string  :eyecolor
      t.string  :haircolor
      t.string  :ol_number
      t.string  :ol_state

      t.boolean :active
      
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
