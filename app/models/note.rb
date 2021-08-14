class Note < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # note.user.nameとせず、note.user_nameとしてnoteに紐づくuserのnameが取得できる
  # prefixオプションなしの場合はnote.nameでnoteに紐づくuserのnameが取得できる
  delegate :name, to: :user, prefix: true

  validates :message, presence: true

  scope :search, ->(term) {
    where("LOWER(message) LIKE ?", "%#{term.downcase}%")
  }

  has_attached_file :attachment

  validates_attachment :attachment,
    content_type: {
      content_type: [
        "image/jpeg",
        "image/gif",
        "image/png",
        "application/pdf",
      ],
    }
end
