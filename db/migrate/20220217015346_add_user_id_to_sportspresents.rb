class AddUserIdToSportspresents < ActiveRecord::Migration[6.1]
  def change
    add_column :sportspresents, :user_id, :integer
  end
end
