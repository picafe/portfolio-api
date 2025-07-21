class CreateSocials < ActiveRecord::Migration[8.0]
  def change
    create_table :socials do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :logo_url
      t.references :contact, null: false, foreign_key: true
      t.timestamps
    end
  end
end
