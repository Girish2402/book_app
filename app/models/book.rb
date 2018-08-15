class Book
  include Mongoid::Document
  include Mongoid::Search

  #fields
  field :name, type: String
  field :short_desc, type: String
  field :long_desc, type: String
  field :chapter_index, type: String
  field :publish_date, type: Date, default: (Date.today)
  field :genres, type: Array

  # assciations
  belongs_to :author
	has_many :reviews, dependent: :destroy

  search_in :name, :genres, reviews: :reviewer, author: :name

  # validations
  validates_presence_of :name, :publish_date, :genres

  delegate :author_details, to: :author

end
