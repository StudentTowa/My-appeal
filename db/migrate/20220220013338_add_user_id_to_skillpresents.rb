class AddUserIdToSkillpresents < ActiveRecord::Migration[6.1]
  def change
    add_column :skillpresents, :user_id, :integer
  end
end
