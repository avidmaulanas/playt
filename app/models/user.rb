class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_role

  def has_role?(role)
    self.role.eql?(role)
  end

  def set_role
    self.role = "regular"
  end
end
