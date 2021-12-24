# frozen_string_literal: true

class Result < ApplicationRecord
  validates :result, :iteration, numericality: {only_integer: true}

  belongs_to :number
end
