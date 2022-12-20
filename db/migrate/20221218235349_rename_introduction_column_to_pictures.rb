class RenameIntroductionColumnToPictures < ActiveRecord::Migration[6.1]
  def change
    rename_column :pictures, :introduction, :produce
  end
end
