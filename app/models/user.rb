class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :advertisements
  has_many :comments

  def name
    # quand on appellera user.name on aura user.email
    email
  end

end