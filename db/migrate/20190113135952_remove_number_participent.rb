class RemoveNumberParticipent < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :number_participent, :integer
  end
end
