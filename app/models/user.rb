class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def role_is?(role)
  	self.role.name == role.to_s
  end
  
end
