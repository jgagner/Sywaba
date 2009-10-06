require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do

  it "should set custom title" do
    helper.should_receive(:content_for).with(:title)

    helper.title "title" 
  end

end