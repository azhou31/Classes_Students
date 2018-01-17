class Student < ActiveRecord::Base
  belongs_to :dojo
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  def self.cohort student
    self.where("id != ? AND dojo_id = ? AND DATE(created_at) = ?", student.id, student.dojo_id, student.created_at.strftime("%Y-%m-%d"))
  end
end

