class CreateSweetspresents < ActiveRecord::Migration[6.1]
  def change
    create_table :sweetspresents do |t|
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
