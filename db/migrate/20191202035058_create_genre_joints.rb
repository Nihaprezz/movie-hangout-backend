class CreateGenreJoints < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_joints do |t|
      t.integer :movie_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
