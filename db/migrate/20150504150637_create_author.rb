class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :biography
      t.string :birthyear
      t.text :fav_subjects
    end
  end
end
