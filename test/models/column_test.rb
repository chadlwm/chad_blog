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

require 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
