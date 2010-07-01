class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string    :type
      t.string    :number,  :null => false
      t.integer   :offense_id
      t.integer   :location_id
      t.date      :date
      t.timestamp :dispatched_at
      t.timestamp :arrived_at
      t.timestamp :cleared_at
      t.integer   :received_id
      t.text      :narrative

      t.boolean :active

      t.timestamps
    end

    add_index :reports, :number, :unique => true
  end

  def self.down
    drop_table :reports
  end
end
