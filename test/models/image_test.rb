# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  path              :string(255)
#  md5               :string(255)
#  original_filename :string(255)
#  content_type      :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
