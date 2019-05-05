# frozen_string_literal: true

class Department < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, format: {
    with: /\A[a-zA-Z]+\z/,
    message: "only allows letters for department's name"
  }
  validates :name, length: { maximum: 15 }
end
