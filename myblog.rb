require 'Date'

class Blog

  def initialize
    @post_list = []
  end

  def add_post(title,date,text)
    @post_list << (Post.new(title,date,text))
  end

  def front_page
    @post_list.sort_by{|post| post.date }.each do |post|
      post.print_it
    end
  end
end

class Post 

  attr_accessor :date
  
  def initialize(title,date,text)
    @title = title
    @date  = date
    @text  = text
  end

  def print_it
    puts @title
    puts "*************"
    puts @text
    puts "-------------"
  end

end

my_blog = Blog.new()
my_blog.add_post("First post", Date.new(2015,03,01) , "Hi,world")
my_blog.add_post("Second post", Date.new(2016,03,01), "Keep writing")

my_blog.front_page