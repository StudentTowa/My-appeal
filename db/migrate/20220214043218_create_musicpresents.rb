class CreateMusicpresents < ActiveRecord::Migration[6.1]
  def change
    create_table :musicpresents do |t|
      t.text :body

      t.timestamps
    end
  end
end
