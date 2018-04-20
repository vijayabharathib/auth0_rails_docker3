class Book < ApplicationRecord
  has_many :shelves, dependent: :destroy
  has_many :users, through: :shelves
  scope :by_user, ->(user) { where(user_id: user.id)}
  scope :within_shelf, ->(place,user) {
    joins(:shelves,:users) 
    .where(shelves: {place: place, users: {id: user.id}})
  }
  # Book.joins(:shelves,:users).where(shelves: {place: "done", users: {id: 3}})
end
