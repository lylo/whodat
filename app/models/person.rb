class Person < ApplicationRecord
  include Discard::Model

  has_one_attached :avatar
end
