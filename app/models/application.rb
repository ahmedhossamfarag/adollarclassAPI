class Application < ApplicationRecord
  belongs_to :user, validate: true, touch: true, dependent: :destroy
  validates_uniqueness_of :user

  enum :status, [ :pending, :accepted, :rejected ], default: :pending, validate: true
end
