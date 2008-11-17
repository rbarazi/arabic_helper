require 'test/unit'

require 'rubygems'
# Fix the no such file to load -- html/document (MissingSourceFile) error
$:.unshift Gem.searcher.find('actionpack').full_gem_path + '/lib/action_controller/vendor/html-scanner'
gem 'rails', '<2.2'
require 'active_support'
require 'action_view'
require 'active_record'

$:.unshift File.dirname(__FILE__) + '/../lib'
require File.dirname(__FILE__) + '/../init'
 
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
 
# AR keeps printing annoying schema statements
$stdout = StringIO.new
 
def setup_db
  ActiveRecord::Base.logger
  ActiveRecord::Schema.define(:version => 1) do
    create_table :posts do |t|
      t.column :id, :integer
      t.column :title, :string
      t.column :body, :text
      t.column :category_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    create_table :categories do |t|
      t.column :id, :integer
      t.column :name, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end
end
 
def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end
 
setup_db
class Post < ActiveRecord::Base
  belongs_to :category
  has_arabic_attributes :title => "العنوان",
                        :body => "النص"
end
class Category < ActiveRecord::Base
  has_many :posts
  validates_presence_of :name
  has_arabic_attributes :name => "الاسم"
end
teardown_db

class ArabicHelperTest < Test::Unit::TestCase
  
  def setup
    setup_db
    @category = Category.create(:name => 'The category')
    @post = Post.create(:title => 'Some title', :body => 'Some text here', :category_id => @category.id)
  end
 
  def teardown
    teardown_db
  end
 
  def test_creation_of_arabic_for_attributes
    assert Post.respond_to?('arabic_for')
    assert Category.respond_to?('arabic_for')
  end
  
  def test_creation_of_arabic_full_messages_attributes
    assert @post.methods.include?('arabic_full_messages')
    assert @category.methods.include?('arabic_full_messages')
  end
    
  def test_arabic_for
    assert_equal Post.arabic_for[:title], "العنوان"
    assert_equal Post.arabic_for[:body], "النص"
    assert_equal Category.arabic_for[:name], "الاسم"
  end
  
  def test_arabic_full_messages
    category = Category.create(:name => nil)
    assert_equal category.arabic_full_messages, ["الاسم فارغ, نرجو ملء الحقل"]
  end
end