class Schedule < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :start_datetime, presence: true
  validates :finish_datetime, presence: true
  validate :datetime_check
  
  def datetime_check
    if start_datetime.blank? || finish_datetime.blank?
      errors
    elsif self.start_datetime < DateTime.now
      errors.add(:start_datetime, 'は現在の日時より遅い時間を選択してください')
    elsif self.start_datetime > self.finish_datetime
      errors.add(:finish_datetime, 'は開始日時より遅い時間を選択してください')
    end
  end
end