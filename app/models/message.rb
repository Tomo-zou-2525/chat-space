class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, presence: true, unless: :image?

  mount_uploader :image, ImageUploader #image_uploaderをマウントする記述
end
#unlessはifの逆の役割があります。if: :image?であれば、imageカラムが空でなければという意味になりますので、unless: :image?はimageカラムが空だったらという意味です。