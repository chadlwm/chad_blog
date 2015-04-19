# == Schema Information
#
# Table name: columns
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  introduce   :text
#  created_at  :datetime
#  updated_at  :datetime
#  posts_count :integer
#

class Column < ActiveRecord::Base
  validates :name, :introduce, :slug, presence: true
  validates_uniqueness_of :name, :slug

  has_many :posts, dependent: :destroy
end
