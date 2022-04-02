class AddUserIdToMoviepresents < ActiveRecord::Migration[6.1]
  def change
    add_column :moviepresents, :user_id, :integer
  end
end
