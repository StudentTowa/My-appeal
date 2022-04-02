class CreateRelaxlikes < ActiveRecord::Migration[6.1]
  def change
    create_table :relaxlikes do |t|
      t.references :relaxpresent, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
