class Conference < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :location, presence: true
  validates :start_date, presence: true

  include PgSearch
  pg_search_scope :search, against: [:title, :location, :description, :start_date, :end_date],
                  using: {tsearch: {dictionary: "english"}},
                  associated_against: {user: [:name, :email]}

  def self.text_search(keywords)
    search(keywords)
  end
end
