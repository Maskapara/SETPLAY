class NumberParticipent < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :number_participent, :integer
  end
end
