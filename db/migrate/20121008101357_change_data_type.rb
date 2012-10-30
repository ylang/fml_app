class ChangeDataType < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    change_column :messages, :content, :text
  end
end
