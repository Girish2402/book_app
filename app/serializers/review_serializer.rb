class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :reviewer, :rating, :title, :desc
end
