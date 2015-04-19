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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
