class AddTitleToSkillpresents < ActiveRecord::Migration[6.1]
  def change
    add_column :skillpresents, :title, :text
  end
end
