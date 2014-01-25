class CreateMemberImages < ActiveRecord::Migration
  def change
    create_table :member_images do |t|
      t.references :member, null: false #外部キー,t.integer :member_idと同義
      t.binary :data #　画像データ
      t.string :content_type #MIMEタイプ
      t.timestamps
    end
  end
end
