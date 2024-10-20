class Student < ApplicationRecord
    has_one_attached :profile_picture
    VALID_MAJORS = ["Computer Science", "Cyber Security", "Computer Engineering"]

    # Validations to ensure presence of fields
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :school_email, presence: true, uniqueness: true,
                format: { with: /\A[^@\s]+@msudenver\.edu\z/, message: "must be a valid @msudenver.edu email" }
    validates :major, presence: true
    validates :minor, presence: true
    validates :graduation_date, presence: true
  end