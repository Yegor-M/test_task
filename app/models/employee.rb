# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :name, presence: true
  validates :name, format: {
    with: /\A[a-zA-Z]+\z/,
    message: "only allows letters for employee's name"
  }
  validates :name, length: { minimum: 3 }
  validates :name, length: { maximum: 10 }

  belongs_to :department
end
