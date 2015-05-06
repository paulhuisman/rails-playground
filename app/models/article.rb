class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history

	has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5 }

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :playground_overiew => "269x200#", :playground_wide  => "898x200#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end	