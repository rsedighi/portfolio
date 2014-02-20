class AddCommentableToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_id, :int
    add_column :comments, :commentable_type, :string

    remove_column :comments, :post_id
  end
end
