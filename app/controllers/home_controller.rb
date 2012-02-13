class HomeController < ApplicationController
  def index

  end

  def simple
    
  end

  def generate_simple
    num_paragraphs = params[:num_paragraphs]
    open_and_read_file
    paragraphs = @contents.split("\n")

    @new_content = ""
    0.upto(num_paragraphs.to_i).each {|i| @new_content << "#{paragraphs[i].to_s}\n" }
  end

  def generate
    num_rows = params[:num_rows]
    column_name = params[:column_name]
    table_name = params[:table_name]

    open_and_read_file

    paragraphs = @contents.split("\n")
    @new_content = ""

    num_rows.to_i.downto(0).each do
      row_content = ""
      0.upto(rand(paragraphs.length)).each {|i| row_content << "#{paragraphs[i].to_s}<br />" }
      @new_content << "INSERT into #{table_name} (#{column_name}) VALUES('#{row_content}');\n"
    end
  end

  private
  def open_and_read_file
    @file = File.open("#{Rails.root}/public/lorem.txt", "rb")
    @contents = @file.read        
  end
end
