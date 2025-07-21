class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :live_url
      t.string :github_url
      t.text :tools_used, null: false
      t.text :timeline
      t.boolean :featured, default: false

      t.timestamps
    end
    add_index :projects,  :featured
  end
end
