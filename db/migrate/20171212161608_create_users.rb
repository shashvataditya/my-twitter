class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	  t.string "email", :limit => 50, :null => false
      t.column "password", :string, :limit => 50, :null => false
      t.string "name", :limit => 50, :null => false
      t.string "username", :limit => 50, :null => false

      t.timestamps
    end
  end
end
