class AddColumnsViewsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :views_count, :integer, default: 0
  end
end
