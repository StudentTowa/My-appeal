class AddImageToSportspresents < ActiveRecord::Migration[6.1]
  def change
    add_column :sportspresents, :image, :string
  end
end
