require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')


describe "posts/new.html.haml" do
  before(:each) do
    @post = mock_model(Post, :null_object=>true)
    assigns[:post] = @post
  end

  it "should show the form partial" do

    template.should_receive(:render).
        with(
        :partial=>"form",
        :locals=>{:post=>@post}
    ).
    and_return "rendered form partial"  

    render 'posts/new.html.haml'
    response.should contain("rendered form partial")

  end
end