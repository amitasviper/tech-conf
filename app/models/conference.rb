class Conference < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :location, presence: true
  validates :start_date, presence: true

  include PgSearch
  pg_search_scope :search, against: [:title, :location, :description, :start_date, :end_date],
                  using: {tsearch: {dictionary: "english"}},
                  associated_against: {user: [:name, :email]}

  def self.get_all()
    filters = {}
    text_search(filters)
  end

  def self.text_search(filters)
    search_keywords = filters[:query]
    search_start_date = filters[:search_start_date]
    search_end_date = filters[:search_end_date]
    search_start_date = search_start_date.to_date if search_start_date
    search_end_date = search_end_date.to_date if search_end_date

    if search_keywords.blank?
      conferences = Conference.all
    else
      conferences = search(search_keywords)
    end
    conferences = conferences.where('start_date > ?', search_start_date) if search_start_date && !search_start_date.blank?
    conferences = conferences.where('start_date < ?', search_end_date) if search_end_date && !search_end_date.blank?
    conferences.order(:start_date)
  end
end
