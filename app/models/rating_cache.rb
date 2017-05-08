class RatingCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :cacheable, :polymorphic => true
end