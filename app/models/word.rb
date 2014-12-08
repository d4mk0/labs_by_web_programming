class Word < ActiveRecord::Base
  validates_uniqueness_of :text
end
