# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :effort, presence: true
end
