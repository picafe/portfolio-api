class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :email, null: false
      t.string :github_url
      t.timestamps
    end
  end
end
