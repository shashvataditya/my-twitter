class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string "about", :limit => 1000
      t.string "schoolname", :limit => 50

      t.timestamps
    end
  end
end
