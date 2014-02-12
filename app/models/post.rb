class Post < ActiveRecord::Base

  validates :title, :presence => true,
                    :length => { :minimum => 5 }

  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy

  def publish!
    published = true
    save!
  end
end
