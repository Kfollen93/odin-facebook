class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|

      t.timestamps
      t.belongs_to :requestor, class_name: :User
      t.belongs_to :receiver, class_name: :User
    end
  end
end
