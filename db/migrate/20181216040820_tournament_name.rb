class TournamentName < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :tournament_name, :text
  end
end
