class AddUserIdToSweetspresents < ActiveRecord::Migration[6.1]
  def change
    add_column :sweetspresents, :user_id, :integer
  end
end
