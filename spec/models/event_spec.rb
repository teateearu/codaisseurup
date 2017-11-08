require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
  end
end

  describe "#bargain?" do
    let(:bargain_event) { create :event, price: 5 }
    let(:non_bargain_event) { create :event, price: 20 }

  it "returns true if the price is smaller than 10 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
  end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 10 }
    let!(:event2) { create :event, price: 20 }
    let!(:event3) { create :event, price: 5 }

  it "returns a sorted array of event by prices" do
    expect(Event.order_by_price).to eq([event3, event1, event2])
  end
end
end

# require 'rails_helper'
#
# RSpec.describe Event, type: :model do
#   describe "validations" do
#     it { is_expected.to validate_presence_of(:name) }
#     it { is_expected.to validate_presence_of(:description).is_at_most(500) }
#     it { is_expected.to validate_presence_of(:location) }
#     it { is_expected.to validate_presence_of(:price) }
#     it { is_expected.to validate_presence_of(:capacity) }
#     it { is_expected.to validate_presence_of(:includes_food) }
#     it { is_expected.to validate_length_of(:includes_drinks) }
#     it { is_expected.to validate_presence_of(:starts_at) }
#     it { is_expected.to validate_length_of(:ends_at) }
#     it { is_expected.to validate_presence_of(:active) }
#     it { is_expected.to validate_presence_of(:user) }
#   end
# end
