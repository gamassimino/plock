require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @track = tracks(:one)
    @user = users(:one)
    @project = projects(:one)
    sign_in @user
  end

  test 'should get index' do
    get tracks_url
    assert_response :success
  end

  test 'should get new' do
    get new_track_url
    assert_response :success
  end

  # test "should create track" do
  #   assert_difference('Track.count') do
  #     post tracks_url, params: { track: { description: @track.description,
  #     end_at: @track.end_at,
  #     name: @track.name,
  #     starts_at: @track.starts_at,
  #     status: @track.status,
  #     user_id: @user.id,
  #     project_id: @project.id} }
  #   end
  #
  #   assert_redirected_to track_url(Track.last)
  # end

  test 'should show track' do
    get track_url(@track)
    assert_response :success
  end

  test 'should get edit' do
    get edit_track_url(@track)
    assert_response :success
  end

  # test "should update track" do
  #   patch track_url(@track), params: { track: { description: @track.description,
  #     end_at: @track.end_at,
  #     name: @track.name,
  #     starts_at: @track.starts_at,
  #     status: @track.status,
  #     user_id: @user.id,
  #     project_id: @project.id} }
  #   assert_redirected_to track_url(@track)
  # end

  test 'should destroy track' do
    assert_difference('Track.count', -1) do
      delete track_url(@track)
    end

    assert_redirected_to tracks_url
  end
end