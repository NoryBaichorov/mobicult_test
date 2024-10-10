# frozen_string_literal: true

class Footballer < ApplicationRecord
  enum :role, { forward: 0, midfielder: 1, defender: 2, goalkeeper: 3 }

  has_many :statistics
end
