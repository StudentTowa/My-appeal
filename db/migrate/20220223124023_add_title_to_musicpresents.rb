class AddTitleToMusicpresents < ActiveRecord::Migration[6.1]
  def change
    add_column :musicpresents, :title, :text
  end
end
