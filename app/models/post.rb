# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  raw_content  :text
#  html_content :text
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  column_id    :integer
#

class Post < ActiveRecord::Base
  validates_presence_of :title, :raw_content, :html_content
  validates_uniqueness_of :title

  belongs_to :column, counter_cache: true
  belongs_to :author, class_name: User.to_s, foreign_key: 'user_id'
end
