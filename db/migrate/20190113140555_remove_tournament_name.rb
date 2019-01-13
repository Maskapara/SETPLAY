class RemoveTournamentName < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :tournament_name, :text
  end
end
