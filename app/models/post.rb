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
#  slug         :string(255)
#  cover        :string(255)
#  summary      :text
#  views_count  :integer          default(0)
#

class Post < ActiveRecord::Base
  validates_presence_of :title, :raw_content, :html_content, :slug
  validates_uniqueness_of :title, :slug

  belongs_to :column, counter_cache: true
  belongs_to :author, class_name: User.to_s, foreign_key: 'user_id'

  acts_as_taggable
  mount_uploader :cover, ImageUploader

  def increase_views_count
  	self.update_column(:views_count, self.views_count.next)
  end
end
