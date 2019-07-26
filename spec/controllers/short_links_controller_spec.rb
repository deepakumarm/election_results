require 'rails_helper'

RSpec.describe ShortLinksController, type: :controller do
  describe "#redirect_to_original_url" do
    let(:short_link) {ShortLink.create(name: 'www.gmail.com',value: 0)}

    it 'should be 0 when original url is visited' do
    expect(short_link.value).to eq(0)
    end

    filter = find_maching_before_filter()
    assert_before_filter_applied(filter, action)

    subject {get "/s/#{short_link.id}"}.to filter(:after)
    it 'should increment the count by 1 original url is visited' do
      # expect {subject}.to change{ short_link.value }.by(1)
      expect(short_link.value).to eq(1)
    end
  end

end
