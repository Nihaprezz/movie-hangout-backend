class AddMovieTitleToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :movie_title, :string
  end
end
