class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|

      t.timestamps
      t.belongs_to :friend_a, class_name: :User
      t.belongs_to :friend_b, class_name: :User
    end
  end
end
