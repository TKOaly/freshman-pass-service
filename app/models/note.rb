class Note < ApplicationRecord
  belongs_to :from, :class_name => 'User', required: false
  belongs_to :to, :class_name => 'User'

  # validates :participation, :presence => true, uniqueness: true
  # validates :participant, :presence => true
  validates :points,
            presence: true
  validates :description,
            presence: true
  validates :to,
            presence: true,
            associated: true

  scope :visible, -> { where(points_hidden: [nil, false]) }

end
