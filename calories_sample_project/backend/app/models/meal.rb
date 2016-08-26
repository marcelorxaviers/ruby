class Meal < ActiveRecord::Base
  belongs_to :user
  scope :by_day_by_user_id, ->(day, user_id) { where(day: day, user_id: user_id) }

  TIME_FORMAT = /([01]?[0-9]|2[0-3]):[0-5][0-9]/
  validates :note, :day, :user_id, :calories, presence: true
  validates :calories, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
  validates :time, format: { with: TIME_FORMAT, message: 'only 24 Hours time is allowed.' }

  def time
    return nil if self[:time].blank?
    hours = self[:time].to_i / 60
    minutes = self[:time].to_i % 60
    "#{hours}:#{minutes < 10 ? '0' : ''}#{minutes}"
  end

  def time=(t)
    return nil unless t.present?
    self[:time] = Meal.parse_time(t)
  end

  def self.filter(filters)
    q = (q || self).where(user_id: filters[:user_id]) if filters[:user_id].present?
    q = (q || self).where("day <= ?", filters[:toDay].to_date) if filters[:toDay].present?
    q = (q || self).where("day >= ?", filters[:fromDay].to_date) if filters[:fromDay].present?
    q = (q || self).where("time <= ?", parse_time(filters[:toHour])) if filters[:toHour].present?
    q = (q || self).where("time >= ?", parse_time(filters[:fromHour])) if filters[:fromHour].present?
    q || self.all
  end

  def jsonify
    {
      id: id, day: day, calories: calories, note: note, user_id: user_id,
      total_calories: total_calories, expected_calories: user.expected_calories,
      user: user.email, time: time
    }
  end

  def total_calories
    Meal.by_day_by_user_id(self.day, self.user_id).pluck(:calories).sum
  end

  def parsed_errors
    self.errors.messages.map { |k, v| "#{k}: #{v.join(' and/or ')}" }
  end

  private

  def self.parse_time(time)
    return nil unless TIME_FORMAT =~ time
    v = time.split(':')
    return nil if v[0].to_i > 24 || v[1].to_i > 59
    v[0].to_i * 60 + v[1].to_i
  end

end
