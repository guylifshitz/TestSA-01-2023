class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :author, null: false
      t.text :body_french
      t.text :body_pioupiou
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
