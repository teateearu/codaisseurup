class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate  :end_after_start

  after_initialize :set_default_values
    def set_default_values
      self.price  ||= 0.0
      self.includes_food ||= false
      self.includes_drinks ||= false
      self.active ||= true
    end

    # validate :you_are_planning_the_past
    #
    #  def you_are_planning_the_past
    #    if startdate_before_enddate?
    #      true
    #    else
    #      errors.add(:ends_at, "End Date must be at least a day later than start date.")
    #    end
    #  end
    #
    #  def startdate_before_enddate?
    #    ends_at - starts_at >= 1
    #  end

     def self.order_by_price
       order :price
     end

     def bargain?
       price < 10
     end

     private
def end_after_start
  return if ends_at.blank? || starts_at.blank?

  if ends_at <= starts_at + 1.day
    errors.add(:ends_at, "must be after the start date")
  end
end
  # inclusion: { in: (:starts_at+24.hours) }, after: :starts_at + 24.hours
    # validate :starts_at_before_ends_at

    # def starts_at_before_ends_at
    #   if self.starts_at +24.hours <= self.ends_at
    #     return true
    #   else self.starts_at > self.ends_at
    #     return false
    #   end
    # end

end
