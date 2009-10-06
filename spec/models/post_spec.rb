require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do

  before(:each) do
    @post = Post.new(:title => "My Title", :content => "Content here")
  end

  describe "validation" do
    it "should be valid with valid attributes" do
      @post.should be_valid
    end
    it "should not be valid without a title" do
      @post.title = nil;
      @post.should_not be_valid
    end
    it "should not be valid without content" do
      @post.content = nil
      @post.should_not be_valid
    end
  end
end