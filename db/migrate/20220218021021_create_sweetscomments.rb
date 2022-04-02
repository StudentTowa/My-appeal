class CreateSweetscomments < ActiveRecord::Migration[6.1]
  def change
    create_table :sweetscomments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :sweetspresent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
