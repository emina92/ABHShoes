class Product < ActiveRecord::Base
	belongs_to :category
  belongs_to :brand
  has_many :colors

	validates :title, presence:true
	validates :price, presence:true

	has_attached_file :image,
  	:storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public'
  	validates_attachment :image,
  	:presence => true,
  	:content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  def self.get_discounted_items
    self.where("discount IS NOT NULL")
  end 

  def apply_discount()
    price = self.price
    discount = self.discount
    return price if discount.nil?
    if discount.present?
        price = price - ((price / 100) * discount)
        return price
    end
  end
end
