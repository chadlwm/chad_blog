class AddColumnColumnIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :column_id, :integer
  end
end
