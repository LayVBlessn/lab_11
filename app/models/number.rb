# frozen_string_literal: true

class Number < ApplicationRecord
  validates :number, numericality: {only_integer: true}

  has_many :results
end
