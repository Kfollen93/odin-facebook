class FriendRequest < ApplicationRecord
  belongs_to :requestor, class_name: :User
  belongs_to :receiver, class_name: :User
end

=begin

irb(main):009:0> user.friend_requests_as_requestor.create(requestor_id: user.id, receiver_id: friend_a.id)
   (0.2ms)  BEGIN
  User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 7], ["LIMIT", 1]]
  User Load (0.1ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 20], ["LIMIT", 1]]
  FriendRequest Create (1.4ms)  INSERT INTO "friend_requests" ("created_at", "updated_at", "requestor_id", "receiver_id") VALUES ($1, $2, $3, $4) RETURNING "id"  [["created_at", "2020-11-13 03:23:41.201678"], ["updated_at", "2020-11-13 03:23:41.201678"], ["requestor_id", 7], ["receiver_id", 20]]
   (0.4ms)  COMMIT
=> #<FriendRequest id: 1, created_at: "2020-11-13 03:23:41", updated_at: "2020-11-13 03:23:41", requestor_id: 7, receiver_id: 20>
irb(main):010:0> 

=end

