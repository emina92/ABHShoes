class Product < ActiveRecord::Base
	validates :title, presence:true
	validates :price, presence:true

	has_attached_file :image,
  	:storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public'
  	validates_attachment :image,
  	:presence => true,
  	:content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
