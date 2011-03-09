require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Survey.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

end
