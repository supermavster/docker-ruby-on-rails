class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :isbn
      t.integer :pages_count

      t.timestamps
    end
  end
end
