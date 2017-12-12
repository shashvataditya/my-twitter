class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string "content", :limit => 140, :null => false

      t.timestamps
    end
  end
end
