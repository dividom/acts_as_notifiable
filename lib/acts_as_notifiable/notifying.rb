module ActsAsNotifiable
  class Notifying < ActiveRecord::Base

    belongs_to :notification, class_name: "::ActsAsNotifiable::Notification"
    belongs_to :notified, polymorphic: true

    scope :unread, -> { where(is_read: true) }

    validates_presence_of :notification_id
    validates_uniqueness_of :notification_id, scope: [:notified_id, :notified_type]

    validate :ensure_notified

    def ensure_notified
      errors.add(:notified, "is not a ::ActsAsNotifiable::Notified object") unless
        self.notified.respond_to?(:is_notified?) && self.notified.is_notified?
    end
  end
end
