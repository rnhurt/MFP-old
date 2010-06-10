class CreateNcicCodes < ActiveRecord::Migration
  def self.up
    create_table :ncic_codes do |t|
      t.string :code_type
      t.string :code
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :ncic_codes
  end
end
