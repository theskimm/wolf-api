# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :birthdate, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
