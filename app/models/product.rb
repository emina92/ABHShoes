class Product < ActiveRecord::Base
	belongs_to :category
  belongs_to :brand
  has_many :product_variants
  has_many :cart_items

  accepts_nested_attributes_for :product_variants, allow_destroy: true

	validates :title, presence:true, length: { in: 3..20 }
	validates :price, presence:true
  validates :category_id, presence:true
  validates :brand_id, presence:true
  validates :description, length: { maximum: 80 }

	has_attached_file :image,
  	:storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  

  validates_attachment :image,
  	:presence => true,
  	:content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
  
  def s3_credentials
    {
      :bucket => ENV["S3_BUCKET"],
      :access_key_id => ENV["ACCESS_KEY_ID"],
      :secret_access_key => ENV["SECRET_ACCESS_KEY"]
    }
  end

  def self.get_discounted_items
    self.where("discount IS NOT NULL")
  end 

  def apply_discount
    price = self.price
    discount = self.discount
    return price if discount.nil?
    if discount.present?
        price = price - ((price / 100) * discount)
        return price
    end
  end

  def self.size_options
    (17..50).to_a.collect{|p| ["#{p}", p]}
  end
end
