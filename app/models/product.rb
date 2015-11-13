class Product < ActiveRecord::Base
	validates :title, presence:true
	validates :price, presence:true

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment :image,
  	:presence => true,
  	:content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
