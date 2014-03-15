class Integration < ActiveRecord::Base
  belongs_to :admin_user
  has_many :integration_edits

  validates :title,
    presence: true

  scope :visible, lambda { where(visible: true) }

  def newest_integration_edit
    integration_edits.order(:created_at).last
  end
end
