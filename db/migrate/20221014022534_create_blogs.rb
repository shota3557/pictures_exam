class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.text :content
      t.text :image

      t.timestamps
    end
  end
end
