class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.datetime :completd_at
      t.belongs_to :user, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
