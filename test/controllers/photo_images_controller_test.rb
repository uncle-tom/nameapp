require 'test_helper'

class PhotoImagesControllerTest < ActionController::TestCase
  setup do
    @photo_image = photo_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_image" do
    assert_difference('PhotoImage.count') do
      post :create, photo_image: {  }
    end

    assert_redirected_to photo_image_path(assigns(:photo_image))
  end

  test "should show photo_image" do
    get :show, id: @photo_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_image
    assert_response :success
  end

  test "should update photo_image" do
    patch :update, id: @photo_image, photo_image: {  }
    assert_redirected_to photo_image_path(assigns(:photo_image))
  end

  test "should destroy photo_image" do
    assert_difference('PhotoImage.count', -1) do
      delete :destroy, id: @photo_image
    end

    assert_redirected_to photo_images_path
  end
end
