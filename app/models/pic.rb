class Pic < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  acts_as_votable
end
