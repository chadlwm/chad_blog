# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  md5        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
