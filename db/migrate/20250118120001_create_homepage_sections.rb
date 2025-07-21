class CreateHomepageSections < ActiveRecord::Migration[8.0]
  def change
    create_table :homepage_sections do |t|
      t.text :description, null: false
      t.boolean :particle_effects_enabled, default: true
      t.timestamps
    end
  end
end
