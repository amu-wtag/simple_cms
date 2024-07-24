class Subject < ApplicationRecord

    #has_one :page# 1 to 1
    has_many :pages # 1 to many
    
    scope :visible, lambda { where(:visible => true)}
    scope :invisible, lambda { where(:visible => false)}
    scope :sorted, lambda { order("position ASC")}
    scope :newest_first, lambda { order("created_at DESC")}
    scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}
end
