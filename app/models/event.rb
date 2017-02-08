class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true
  validates :exam_type, presence: true
  has_many :apply_tutions
  has_many :billings
end
