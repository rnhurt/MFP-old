class CreateIncidents < ActiveRecord::Migration
  def self.up
    create_table :incidents do |t|
      t.string    :type
      t.integer   :location_id
      t.date      :date
      t.timestamp :dispatch_at
      t.timestamp :arrived_at
      t.timestamp :cleared_at
      t.integer   :received_id
      t.text      :narrative

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :incidents
  end
end
