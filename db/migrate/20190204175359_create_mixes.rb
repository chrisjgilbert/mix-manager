class CreateMixes < ActiveRecord::Migration[5.2]
  def change
    create_table :mixes do |t|
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
