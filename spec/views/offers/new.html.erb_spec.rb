require 'rails_helper'

RSpec.describe "offers/new", type: :view do
  before(:each) do
    assign(:offer, Offer.new(
      :title => "MyString",
      :text => "MyText",
      :user => nil
    ))
  end

  it "renders new offer form" do
    render

    assert_select "form[action=?][method=?]", offers_path, "post" do

      assert_select "input[name=?]", "offer[title]"

      assert_select "textarea[name=?]", "offer[text]"

      assert_select "input[name=?]", "offer[user_id]"
    end
  end
end
