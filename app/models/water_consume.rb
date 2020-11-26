# frozen_string_literal: true

# models/WaterConsume
class WaterConsume < ApplicationRecord
  scope :last_from_day, lambda { |time|
    where('time > ? AND time < ?', time.beginning_of_day, time.end_of_day).order('time DESC')
  }

  scope :last_from_hour, lambda { |time|
    where('time > ? AND time < ?', time.beginning_of_day, time).order('time DESC')
  }
end
