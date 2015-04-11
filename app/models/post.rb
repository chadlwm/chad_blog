class Post < ActiveRecord::Base
  validates_presence_of :title, :raw_content, :html_content
  validates_uniqueness_of :title
end
