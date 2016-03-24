class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, index: true
      t.references :followed, null: false, index: true
      t.timestamps null: false
    end
  end
end
