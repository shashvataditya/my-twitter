class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :follower_id, :references => "user"
  	  t.integer :followee_id, :references => "user"

      t.timestamps
    end
  end
end
