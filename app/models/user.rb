class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :advertisements, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :role

  def name
    # quand on appellera user.name on aura user.email
    email
  end

  def can_comment?
    admin? || registered?
  end

  def insufficient_role?
    user?
  end

  def user?
    role.name == 'user'
  end

  def admin?
    role.name == 'admin'
  end

  def registered?
    role.name == 'registered'
  end
end