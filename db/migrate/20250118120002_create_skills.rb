class CreateSkills < ActiveRecord::Migration[8.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :proficiency, null: false
      t.string :logo_url
      t.timestamps
    end
    add_index :skills, :name, unique: true
  end
end
