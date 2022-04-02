class CreateSportslikes < ActiveRecord::Migration[6.1]
  def change
    create_table :sportslikes do |t|
      t.references :sportspresent, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
