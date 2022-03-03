class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  after_save :reindex_book
  # include Elasticsearch::Model

  searchkick word_start: [:book_name, :author, :description, :category], callbacks: false
  def search_data
    attributes.merge(
      book_name: book_name,
      author: author_nm,
      category: category_name,
      description: description
    )
  end

  def reindex_book
    ElasticSearchReindexJob.perform_later(self.class.to_s)
  end

  def author_nm
    author.author_name
  end

  def category_name
    category.name
  end
end
