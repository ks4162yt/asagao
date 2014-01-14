class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :released_at, null: false #掲載開始日
      t.datetime :expired_at  # 掲載終了日
      t.boolean :member_only, null: false, default:false
      t.timestamps
    end
  end
end
