class AdminUser < ActiveRecord::Base

  has_many :integrations
  has_many :integration_edits
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
