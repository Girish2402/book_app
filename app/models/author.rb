class Author
  include Mongoid::Document
  include Mongoid::Paperclip

  #fields
  field :name, type: String
  field :bio, type: String
  field :academics, type: String
  field :awards, type: String
  has_mongoid_attached_file :avatar

  # assciations
  has_many :books, dependent: :destroy

  # validations
  validates_presence_of :name
  validates_length_of :name, minimum: 3
  validates_attachment_content_type :avatar, content_type: ['image/jpeg', 'image/png', 'application/jpg']

  has_mongoid_attached_file :avatar,
    :default_url => "/default_avatar.png",
    :styles => {
      :original => ['250x250', :jpg]
  }

  def author_details
    self
  end

end