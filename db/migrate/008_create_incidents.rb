class CreateIncidents < ActiveRecord::Migration
  def self.up
    create_table :incidents do |t|
      t.string    :number,      :null => false
      t.string    :category_id
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

    create_table  :incident_categories do |t|
      t.string  :name
      t.string  :description

      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :incidents, :incident_categories
  end
end
