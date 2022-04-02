class CreateSweetslikes < ActiveRecord::Migration[6.1]
  def change
    create_table :sweetslikes do |t|
      t.references :sweetspresent, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
