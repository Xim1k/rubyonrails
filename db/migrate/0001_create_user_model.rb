class CreateUserModel < ActiveRecord::Migration[5.1]
    def self.up
        create_table :users do |t|
            t.column :username, :string  
            t.column :email, :string
            t.column :password_hash, :string  
            t.column :password_salt, :string
        end 
    end

    def self.down
        drop_table :users
    end
end