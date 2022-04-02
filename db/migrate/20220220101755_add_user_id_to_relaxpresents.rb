class AddUserIdToRelaxpresents < ActiveRecord::Migration[6.1]
  def change
    add_column :relaxpresents, :user_id, :integer
  end
end
