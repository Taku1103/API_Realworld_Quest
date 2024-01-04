require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.new(title:"test_title", description: "unko_buriburi", body: "unkoooo")
  end

  test "article body valid?" do
    @article.body = ""
    assert_not @article.valid?
  end

  test "article title valid?" do
    @article.title = ""
    assert_not @article.valid?
  end

end
