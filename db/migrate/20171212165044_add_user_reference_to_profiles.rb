class AddUserReferenceToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :user, index: true
  end
end
