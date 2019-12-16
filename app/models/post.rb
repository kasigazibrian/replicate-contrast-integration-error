# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  has_many :likes, as: :likable

  validates :body, presence: true
  validates :title, presence: true
end
