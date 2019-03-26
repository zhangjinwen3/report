class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :time
      t.text :content
      t.text :record
      t.text :issue
      t.text :task
      t.text :explain
      t.text :summart

      t.timestamps
    end
  end
end
