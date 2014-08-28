class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :sort_order
end