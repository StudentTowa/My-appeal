class AddTitleToMoviepresents < ActiveRecord::Migration[6.1]
  def change
    add_column :moviepresents, :title, :text
  end
end
