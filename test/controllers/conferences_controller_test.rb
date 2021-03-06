require 'test_helper'

class ConferencesControllerTest < ActionController::TestCase
  setup do
    @conference = conferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conferences)
  end

  test 'should list conferences matching given search criteria' do
    search_results = []
    expect(Conference).to receive(:search).with('foo').and_return(search_results)
    get :index, search: 'foo'
    expect(assigns(conferences)).to eq(search_results)
  end

  context 'when search key is not there' do
    test 'should list all the conferences' do

    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conference" do
    assert_difference('Conference.count') do
      post :create, conference: { description: @conference.description, end_date: @conference.end_date, location: @conference.location, start_date: @conference.start_date, title: @conference.title, url: @conference.url }
    end

    assert_redirected_to conference_path(assigns(:conference))
  end

  test "should show conference" do
    get :show, id: @conference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conference
    assert_response :success
  end

  test "should update conference" do
    patch :update, id: @conference, conference: { description: @conference.description, end_date: @conference.end_date, location: @conference.location, start_date: @conference.start_date, title: @conference.title, url: @conference.url }
    assert_redirected_to conference_path(assigns(:conference))
  end

  test "should destroy conference" do
    assert_difference('Conference.count', -1) do
      delete :destroy, id: @conference
    end

    assert_redirected_to conferences_path
  end
end
