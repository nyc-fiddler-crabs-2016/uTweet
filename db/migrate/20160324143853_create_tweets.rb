class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content, null: false, limit: 140
      t.references :poster, null: false, index: true
      t.timestamps null: false
    end
  end
end
