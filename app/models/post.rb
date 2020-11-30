class Post < ApplicationRecord
  belongs_to :user, optional: true # optional tag allows me to create posts on index page as the timeline.
end
