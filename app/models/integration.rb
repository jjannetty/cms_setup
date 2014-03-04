class Integration < ActiveRecord::Base
  validates :title,
    presence: true

  scope :visible, lambda { where(visible: true) }
end
