class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists, comment: '周报表' do |t|
      t.string :idcard, comment: '身份证'
      t.string :phone

      t.timestamps
    end
  end
end
