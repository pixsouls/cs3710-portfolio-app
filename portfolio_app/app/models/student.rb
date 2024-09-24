class Student < ApplicationRecord
    has_one_attached :profile_picture

    # Validations to ensure presence of fields
    validates :name, presence: true
    validates :school_email, presence: true, uniqueness: true,
                format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/, message: "is in an invalid e-mail format"}
    validates :major, presence: true
    validates :minor, presence: true
    validates :graduation_date, presence: true
  end