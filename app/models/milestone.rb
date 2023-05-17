# frozen_string_literal: true

class Milestone < ApplicationRecord
  validates :name, presence: true
end
