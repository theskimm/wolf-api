# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :difficulty_level, presence: true
end
