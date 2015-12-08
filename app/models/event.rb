class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :group
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title,   presence: true
  validates :content, presence: true
  validate  :end_date_after_start_date?
  validate  :picture_size
  
  private

    def end_date_after_start_date?
      if single_day == "f"
        if end_date < start_date
          errors.add(:end_date, "must be after start date")
        end
      end
    end
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
