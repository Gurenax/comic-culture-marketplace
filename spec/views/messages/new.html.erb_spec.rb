require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :user => nil,
      :conversation => nil,
      :body => "MyText"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input[name=?]", "message[user_id]"

      assert_select "input[name=?]", "message[conversation_id]"

      assert_select "textarea[name=?]", "message[body]"
    end
  end
end
