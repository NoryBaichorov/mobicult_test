# frozen_string_literal: true

class Statistic < ApplicationRecord
  belongs_to :footballer
  belongs_to :match
end
