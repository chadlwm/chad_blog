class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :path
      t.string :md5
      t.string :original_filename
      t.string :content_type

      t.timestamps
    end
  end
end
