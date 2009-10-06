require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "posts/index.html.haml" do
  before(:each) do

    @posts = stub
    assigns[:posts] = @posts
  end

  it "should loop through each post" do
    @posts.should_receive(:each)
    render "posts/index.html.haml"

    #TODO: this test needs help -jg 
  end
end