class Student < ApplicationRecord
    has_one_attached :profile_picture

    # Validations to ensure presence of fields
    validates :name, presence: true
    validates :school_email, presence: true, uniqueness: true,
                format: { with: /\A[^@\s]+@msudenver\.edu\z/, message: "must be a valid @msudenver.edu email" }
    validates :major, presence: true
    validates :minor, presence: true
    validates :graduation_date, presence: true
  end