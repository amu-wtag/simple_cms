class Subject < ApplicationRecord
  acts_as_list
  # has_one :page# 1 to 1
  has_many :pages # 1 to many

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }
  scope :search, ->(query) { where(['name LIKE ?', "%#{query}%"]) }

  validates_presence_of :name # error: can't be blank
  validates_length_of :name, maximum: 255 # Allows only spaces
end
