class AddColumnPostsCountToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :posts_count, :integer
  end
end
