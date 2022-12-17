class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :location
      t.text :introduction

      t.timestamps
    end
  end
end
