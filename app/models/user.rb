class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook vkontakte]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length:  {maximum: 35}

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def self.find_for_oauth(access_token)
    # Достаём email из токена
    name = access_token.info.name
    email = access_token.info.email
    email ||= "change-me-#{access_token.info.first_name}-id#{access_token.uid}@#{access_token.provider}.com"
    user = where(email: email).first

    # Возвращаем, если нашёлся
    return user if user.present?

    # Если не нашёлся, достаём провайдера, айдишник и урл

    provider = access_token.provider
    id = access_token.extra.raw_info.id

    # Теперь ищем в базе запись по провайдеру и урлу
    # Если есть, то вернётся, если нет, то будет создана новая
    case provider
    when 'facebook'
      url = "https://facebook.com/#{id}"
    when 'vkontakte'
       url = "https://vk.com/id#{id}"
    end

    where(url: url, provider: provider).first_or_create! do |user|
      # Если создаём новую запись, прописываем email и пароль
      user.name = name
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
