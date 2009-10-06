require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostsController do

  before(:each) do
    @post = mock_model(Post, :save => nil)
    Post.stub!(:new).and_return(@post)
  end
  
  it "should create new post and redirect" do
    expected_title = "my title"
    expected_content = "my content"
    
    Post.should_receive(:new).
        with("title"=>expected_title,"content"=>expected_content).
        and_return(@post)

    @post.should_receive(:save).
    and_return true
    
    post :create , :post => {:title=>expected_title,:content=>expected_content}

    response.should redirect_to(post_path(@post))
  end

  
  it "should show list of posts at index" do
    Post.should_receive(:all)
    get :index
  end

  it "should destroy a post" do

    Post.should_receive(:find).
    with("1").
    and_return(@post)

    @post.should_receive(:destroy).
    and_return nil

    delete :destroy, :id=>1

  end

  it "should show edit for an existing post" do
    Post.should_receive(:find).
    with("1").
    and_return(@post)

    get :edit, :id=>1
  end
  
  it "should show a post" do
    Post.should_receive(:find).
    with("1").
    and_return(@post)

    get :show,:id=>1
    
  end

  it "should have flash after successful save" do
    Post.should_receive(:new).
    and_return(@post)

    @post.should_receive(:save).
    and_return true  
    post :create

    flash[:notice].should == "Post was successfully created."
  end

  it "should update a post" do
    Post.should_receive(:find).
    with("1").
    and_return(@post)

    expected_title = "updated title"
    expected_content = "updated content"
    @post.should_receive(:update_attributes).
    with("title"=>expected_title,"content"=>expected_content).
    and_return true

    put :update,:id=>1, :post=>{:title=>expected_title,:content=>expected_content}
  end

  it "should show edit form when invalid attributes" do
    Post.should_receive(:find).
    with("1").
    and_return(@post)
    
    @post.should_receive(:update_attributes).
    and_return false

    put :update , :id=>1
    response.should render_template("edit")

    
  end
  
  it "should should show create form when invalid attributes" do
    Post.should_receive(:new).
    and_return(@post)

    @post.should_receive(:save).
    and_return(false)

    post :create

    response.should render_template("new")
  end


  it "should show create form" do
     Post.should_receive(:new)
     get :new 
  end
end