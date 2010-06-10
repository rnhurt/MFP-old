class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string  :category_type
      t.string  :ncic_code
      t.string  :name
      t.string  :description
      
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
