class RemoveColumsFromImages < ActiveRecord::Migration
  def change
  	remove_column :images, :path
  	remove_column :images, :original_filename
  	remove_column :images, :content_type
  end
end
