class Review
  include Mongoid::Document

  #fields
  field :reviewer, type: String
  field :rating, type: Integer
  field :title, type: String
  field :desc, type: String

  # assciations
  belongs_to :book

  # validations
  validates_presence_of :reviewer, :rating
  validates :rating, inclusion: {in: 0..5}
  validates_length_of :reviewer, minimum: 3

end
