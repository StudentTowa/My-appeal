class AddTitleToSweetspresents < ActiveRecord::Migration[6.1]
  def change
    add_column :sweetspresents, :title, :text
  end
end
