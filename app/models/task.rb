class Task < ActiveRecord::Base

  scope :completed, lambda { where('completed_at IS NOT NULL') }
  scope :incompleted, lambda { where(completed_at: nil) }

  def complete?
    !completed_at.nil?
  end

end
