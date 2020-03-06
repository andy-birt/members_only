class Post < ApplicationRecord

  belongs_to :user

  validates :title, presence: :true, length: { minimum: 5, maximum: 80 }
  validates :text, presence: :true, length: { maximum: 320 }

end