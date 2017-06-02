class ServiceManager < ApplicationRecord
  # associations
  has_one :login, class_name: UserLogin.to_s, as: :user, dependent: :destroy

  validates :login, :name, presence: true

  def devise_mailer
    Devise::Mailer
  end

end
