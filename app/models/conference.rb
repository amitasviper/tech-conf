class Conference < ActiveRecord::Base
  validates :title, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
end
