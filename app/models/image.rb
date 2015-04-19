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

require 'fileutils'
class Image < ActiveRecord::Base
  def self.add(params)
    result = []
    params.select{|k, v| /file\d+/ =~ k}.each do |k, v|
      img = Image.new
      img.content_type = v.content_type
      img.original_filename = v.original_filename
      img.md5 = Digest::MD5.hexdigest(File.read(v.tempfile))
      img.path = "#{Image.path_prefix(img.md5)}/#{img.original_filename}"
      img.mv(v.tempfile, img.path)
      img.save
      result << img
    end
    result
  end

  def self.path_prefix(md5)
    "/uploads/img/#{Time.now.strftime("%Y/%m/%d")}/#{md5}"
  end

  def mv(from, to)
    FileUtils.mkdir_p "#{Rails.root}/public#{Image.path_prefix(md5)}"
    FileUtils.mv from, "#{Rails.root}/public#{to}"
  end
end
