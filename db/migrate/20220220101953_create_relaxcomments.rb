class CreateRelaxcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :relaxcomments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :relaxpresent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
