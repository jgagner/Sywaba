require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')



#TODO: remove duplication of finding the form selector... I thought about removing it, but the fields being included in the form is important enough to test
describe '_form.html.haml' do

  def render_form
    render "posts/_form.html.haml", :locals=>{:post=>@post}
  end

  before(:each) do
    @post = mock_model(Post, :null_object=>true).as_new_record
    @post.should_receive(:new_record?).and_return true
    assigns[:post] = @post
  end

  it "should show a form" do
    render_form

    response.should have_selector("form[method=post]", :action=>posts_path)
  end

  it "should show title field" do
    render_form

    response.should have_selector("form[method=post]", :action=>posts_path) do |form|
      form.should have_selector("input[type=text]", :name=>'post[title]')
    end

  end

  it "should show form with title value " do
    expected_title = "bla bla"

    @post.should_receive(:title).
        and_return(expected_title)

    render_form

    response.should have_selector("form[method=post]", :action=>posts_path) do |form|
      form.should have_selector("input[type=text]", :name=>"post[title]", :value=>expected_title)
    end
  end

  it "should show a content field " do
    render_form

    response.should have_selector("form[method=post]", :action=>posts_path) do |form|
      form.should have_selector("textarea", :name=>"post[content]")
    end
  end

  it "should show form with content set" do
    expected_content = "this is my content"

    @post.should_receive(:content).
        and_return(expected_content)

    render_form

    response.should have_selector("form[method=post]", :action=>posts_path) do |form|
      form.should have_selector("textarea", :name=>"post[content]", :content=>expected_content)
    end
  end

  it "should have submit button" do
    @post.should_receive(:content)

    render_form
    
    response.should have_selector("form[method=post]", :action=>posts_path) do |form|
      form.should have_selector("input[type=submit]", :value=>"Create")
    end
  end
end