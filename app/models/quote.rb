class Quote < ActiveRecord::Base
  include Zen
  validates_uniqueness_of :content
end
