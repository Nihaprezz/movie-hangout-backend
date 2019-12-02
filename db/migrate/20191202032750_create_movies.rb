class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :backdrop_path
      t.integer :budget
      t.integer :genre_joint
      t.string :home_path
      t.integer :movieAPI_ID
      t.integer :Imdb_ID
      t.string :original_title
      t.string :overview
      t.string :poster_path
      t.integer :release_date
      t.integer :revenue
      t.integer :runtime
      t.boolean :video
      t.float :vote_average
      t.timestamps
    end
  end
end
