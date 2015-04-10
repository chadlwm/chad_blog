class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :raw_content
      t.text :html_content

      t.timestamps
    end
  end
end
