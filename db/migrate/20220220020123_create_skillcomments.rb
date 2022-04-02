class CreateSkillcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :skillcomments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :skillpresent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
