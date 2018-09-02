class Poll < ApplicationRecord
  validates :title, presence: true
  validates :premise, presence: true
end
