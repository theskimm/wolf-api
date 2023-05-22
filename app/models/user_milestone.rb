# frozen_string_literal: true

class UserMilestone < ApplicationRecord
  validates :name, presence: true
end
