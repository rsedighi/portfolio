class Project < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy
  validates :technologies_used, presence: true
end
