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

class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  def self.add(params)
    result = []
    params.select{|k, v| /file\d+/ =~ k}.each do |k, v|
      md5 = Digest::MD5.hexdigest File.read(v.tempfile)
      unless img = Image.find_by_md5(md5)
        img = Image.new
        img.image = v
        img.md5 = md5
        img.save!
      end
      result << img
    end
    result
  end

end
