class AddImageToMusicpresents < ActiveRecord::Migration[6.1]
  def change
    add_column :musicpresents, :image, :string
  end
end
