class User < ApplicationRecord
  validates :nickname, presence: true, length: { minimum: 3, maximum: 255 }
  validates :experience, presence: true, length: { minimum: 3, maximum: 255 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9\.]+@[a-zA-Z0-9\.]+\.[a-zA-Z0-9]+\z/, message: "Invalid Email" }
  validates :specialty, presence: true, length: { minimum: 3, maximum: 255 }
  validates :qualifications, presence: true, length: { minimum: 3, maximum: 255 }
  validates :password, presence: true
  validates :portfolio, presence: true

  enum :role, [ :educator, :mentor, :counselor, :admin ], default: :educator, validate: true

  def as_json(options: {})
    super({ except: [ :password ] }).merge(options)
  end
end
