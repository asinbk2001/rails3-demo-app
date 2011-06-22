class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 64, :null => false
      t.string :email, :null => false
      t.string :encrypted_password

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
