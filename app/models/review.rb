class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :moviegoer
#   attr_protected :moviegoer_id # see text
#review is validate only if it's associated wit a movie
  validates :movie_id, :presence =>true
#required the referenced movie to be validate in order for the review to be validate
  validates_associated :movie
end