class CreatePictureComments < ActiveRecord::Migration[6.1]
  def change
    create_table :picture_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :picture_id

      t.timestamps
    end
  end
end
