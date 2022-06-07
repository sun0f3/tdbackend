require 'rffdb'

class Product < RubyFFDB::Document
  attribute :name,        :class => String
  attribute :price,       :class => Float
end
