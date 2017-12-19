class CreateFollowRelationships < ActiveRecord::Migration
  def change
    create_table :follow_relationships do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end
    add_index :follow_relationships, :follower_id
    add_index :follow_relationships, :followee_id
    add_index :follow_relationships, [:follower_id, :followee_id]
  end
end
