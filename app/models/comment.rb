class Comment < ApplicationRecord
  validates_presence_of :name
  validates_length_of :name, :within => 2..20
  validates_presence_of :body

  belongs_to :post
end
