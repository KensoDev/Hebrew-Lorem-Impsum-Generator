class HomeController < ApplicationController
  def index

  end

  def generate
    num_rows = params[:num_rows]
    column_name = params[:column_name]
    table_name = params[:table_name]

    @file = File.open("#{Rails.root}/public/lorem.txt", "rb")
    @contents = @file.read

    paragraphs = @contents.split("\n")
    @new_content = ""

    num_rows.to_i.downto(0).each do
      @new_content << "INSERT into #{table_name} (#{column_name}) VALUES"
      @new_content << "("
        0.upto(rand(paragraphs.length)).each do |i|
         @new_content << "'#{paragraphs[i].to_s}<br />'"
        end
      @new_content << ");"
      @new_content << "\n"
    end
  end
end
