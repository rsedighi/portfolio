class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
