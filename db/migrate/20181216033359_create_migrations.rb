class CreateMigrations < ActiveRecord::Migration[5.2]
  def change
    # create_table :migrations do |t|
    #   t.string :orgnizer

    #   t.timestamps

    add_column :posts, :orgnizer, :string

  end
end
