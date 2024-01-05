require "test_helper"

class Api::ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:test_article1)
  end

  test "articles index" do
    get api_articles_path
    assert_response :ok
  end

  test "articles show" do
    get api_article_path(@article.id)
    assert_response :ok
  end
end
