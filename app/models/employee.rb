class Employee < ApplicationRecord
VALID_PHONE_NUMBER = /\A[0-9]+\Z/
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

validates :email, presence: true,
                  uniqueness: { case_sensitive: false},
                  length: { minimum: 3, maximum: 35 },
                  format: { with: VALID_EMAIL_REGEX }
validates :full_name, presence: true,
                length: { minimum: 3, maximum: 25 }
validates :last_names, presence: true,
                length: { minimum: 3, maximum: 25 }
validates :phone_number, presence: true,
                uniqueness: true,
                length: { is: 11 },
                format: { with: VALID_PHONE_NUMBER }
validates :position, presence: true,
                length: { maximum: 25 }
validates :salary, presence: true,
                length: { maximum: 15 }
validates :department, presence: true,
                length: { maximum: 25 }
end
