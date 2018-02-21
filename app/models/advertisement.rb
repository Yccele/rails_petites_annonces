class Advertisement < ApplicationRecord

  belongs_to :user
  has_many :comments

  validates :title, presence: true #, uniqueness: {message: "Titre déjà existant"}

  validates :content, presence: true

  validates :price, presence: true

  scope :validated, -> { where(is_validate: true) }
  scope :no_validated, -> { where(is_validate: false) }

end
