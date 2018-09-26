require 'rails_helper'

RSpec.describe "offers/edit", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
      :title => "MyString",
      :text => "MyText",
      :user => nil
    ))
  end

  it "renders the edit offer form" do
    render

    assert_select "form[action=?][method=?]", offer_path(@offer), "post" do

      assert_select "input[name=?]", "offer[title]"

      assert_select "textarea[name=?]", "offer[text]"

      assert_select "input[name=?]", "offer[user_id]"
    end
  end
end
