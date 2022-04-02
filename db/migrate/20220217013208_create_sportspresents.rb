class CreateSportspresents < ActiveRecord::Migration[6.1]
  def change
    create_table :sportspresents do |t|
      t.text :body

      t.timestamps
    end
  end
end
