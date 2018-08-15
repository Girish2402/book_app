class BookSerializer < ActiveModel::Serializer

  attributes :_id, :name, :short_desc, :long_desc, :chapter_index, :publish_date, :genres
   :author_details
  has_many :reviews

end

