class AddTitleToRelaxpresents < ActiveRecord::Migration[6.1]
  def change
    add_column :relaxpresents, :title, :text
  end
end
