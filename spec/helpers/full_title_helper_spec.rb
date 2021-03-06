# frozen_string_literal: true
require 'rails_helper'

RSpec.describe FullTitleHelper, type: :helper do
  describe 'full_title' do
    context 'page has a title' do
      it 'displays the full title' do
        expect(full_title('Dashboard')).to eq 'Dashboard | Learning Library'
      end
    end

    context 'page does not have a title' do
      it 'displays the right title' do
        expect(full_title(' ')).to eq 'Learning Library'
      end
    end
  end
end
