class Contact < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :contact, :string
  end
end
