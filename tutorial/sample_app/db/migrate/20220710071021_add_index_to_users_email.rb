class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    # 自分で追加！
    add_index :users, :email, unique: true
  end
end
