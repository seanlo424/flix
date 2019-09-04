class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :caption
      t.integer :image_id

      t.timestamps
    end
  end
end
