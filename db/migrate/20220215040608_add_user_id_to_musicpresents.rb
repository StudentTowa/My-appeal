class AddUserIdToMusicpresents < ActiveRecord::Migration[6.1]
  def change
    add_column :musicpresents, :user_id, :integer
  end
end
