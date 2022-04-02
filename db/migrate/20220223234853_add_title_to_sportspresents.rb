class AddTitleToSportspresents < ActiveRecord::Migration[6.1]
  def change
    add_column :sportspresents, :title, :text
  end
end
