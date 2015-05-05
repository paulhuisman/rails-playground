class AddPublishedToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :published, :integer, :null => false, :default => 0
  end
end
