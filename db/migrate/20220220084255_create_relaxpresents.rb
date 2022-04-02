class CreateRelaxpresents < ActiveRecord::Migration[6.1]
  def change
    create_table :relaxpresents do |t|
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
