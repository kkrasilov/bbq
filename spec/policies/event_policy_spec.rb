require 'rails_helper'

RSpec.describe EventPolicy do
  let(:user) { FactoryBot.build_stubbed(:user) }
  let(:event) { FactoryBot.build_stubbed(:event, user: user) }

  subject { EventPolicy }

  context 'user is anonymous' do
    permissions :show?, :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, Event) }
    end
  end

  context 'user is logged in author event' do

    permissions :show?, :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end

  context "user is logged don't author event" do
    let(:other_user) { FactoryBot.build_stubbed(:user) }
    let(:other_event) { FactoryBot.build_stubbed(:event, user: other_user) }

    permissions :show? do
      it { is_expected.to permit(user, other_event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, other_event) }
    end
  end
end
