class RemoveAuthorFromArticles < ActiveRecord::Migration
  def change
  	remove_column :articles, :author
  end
end
