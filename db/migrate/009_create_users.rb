class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :type
      t.string    :first_name
      t.string    :last_name
      t.string    :badge_number

      t.string    :login,             :null => false
      t.string    :email,             :null => false
      t.string    :crypted_password,  :null => false
      t.string    :password_salt,     :null => false
      t.string    :persistence_token, :null => false
      t.string    :perishable_token,  :null => false
      t.integer   :login_count,       :null => false, :default => 0
      t.integer   :failed_login_count,:null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      t.integer   :roles_mask

      t.boolean   :active
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
