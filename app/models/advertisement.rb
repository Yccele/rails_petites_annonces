class Advertisement < ApplicationRecord

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }, default_url: "/system/advertisements/images/missing/:style/missing.png"

  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  belongs_to :user
  belongs_to :category
  has_many :comments
  has_one :adress
  accepts_nested_attributes_for :adress

  validates :title, presence: true #, uniqueness: {message: "Titre déjà existant"}

  validates :content, presence: true

  validates :price, presence: true

  scope :validated, -> { where(is_validate: true) }
  scope :no_validated, -> { where(is_validate: false) }

end
