class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
  validates :ends_at, presence: true

after_initialize :init
def init
  self.price  ||= 0.0           #will set the default value only if it's nil
  self.includes_food ||= false #let's you set a default association
  self.includes_drinks ||= false
  self.active ||= true
end
# after_initialize do
#   default: 0
# end
  # inclusion: { in: (:starts_at+24.hours) }, after: :starts_at + 24.hours

end
