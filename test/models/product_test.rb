require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "the truth" do
    assert true
  end
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert true
  end
  test "product price must be greater than 0.01" do
    product = Product.new(title:        products(:one).title,
                          description:  "Just a short description",
                          image_url:    "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert ["must be greater than or equal to 0.01", product.errors[:price]]

    product.price = 0
    assert product.invalid?
    assert ["must be greater than or equal to 0.01", product.errors[:price]]
  end

end
