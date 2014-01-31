class Post < ActiveRecord::Base

  validates :title, :presence => true,
                    :length => { :minimum => 5 }

  belongs_to :author, class_name: "User"

  def publish!
    published = true
    save!
  end
end
