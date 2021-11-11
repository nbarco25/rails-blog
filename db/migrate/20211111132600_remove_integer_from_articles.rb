class RemoveIntegerFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :integer
  end
end
