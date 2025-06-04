class CreatePostsTags < ActiveRecord::Migration[7.2]
  def change
    create_table :posts_tags do |t|
      t.references :post
      t.references :tag

      t.timestamps
    end
  end
end
