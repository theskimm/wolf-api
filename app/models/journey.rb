# frozen_string_literal: true

class Journey < ApplicationRecord
  validates :name, presence: true
end
