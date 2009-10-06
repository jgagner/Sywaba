require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "posts/show.html.haml" do
  before(:each) do

    @post = stub("Post")
    assigns[:post] = @post
  end

  it "should display the title" do
    expected_title = "this is my title of the post here";
    @post.should_receive(:title).and_return expected_title
    @post.stub! :content

    render "posts/show.html.haml"

    response.should contain(expected_title)
  end

  it "should display the post content" do
    expected_content = "this is my title of the content here";
    @post.should_receive(:content).and_return expected_content
    @post.stub! :title

    render "posts/show.html.haml"

    response.should contain(expected_content)
  end
end