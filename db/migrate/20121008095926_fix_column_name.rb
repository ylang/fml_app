class FixColumnName < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
    rename_column :messages, :anwser, :answer
  end
end
