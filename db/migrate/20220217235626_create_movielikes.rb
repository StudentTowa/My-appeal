class CreateMovielikes < ActiveRecord::Migration[6.1]
  def change
    create_table :movielikes do |t|
      t.references :moviepresent, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
