class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :title
      t.string :image_url
      t.string :random_id
      t.references :user

      t.timestamps
    end
  end
end
