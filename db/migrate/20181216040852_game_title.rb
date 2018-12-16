class GameTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :game_title, :text
  end
end
