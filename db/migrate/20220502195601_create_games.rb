class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :publisher_id
      t.string :name
      t.string :platform
      t.string :store_id
      t.string :bundle_id
      t.string :app_version
      t.boolean :is_published

      t.timestamps
    end
  end
end
