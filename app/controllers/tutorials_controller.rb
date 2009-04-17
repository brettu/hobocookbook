class TutorialsController < ApplicationController
  
  caches_page :index, :show
  
  TITLES = begin
             titles = ActiveSupport::OrderedHash.new
             [['agility',       "Agility - a simple story manager"]].each do |title, desc|
               titles[title]=desc
             end
             titles
           end
  
  def show
    tutorial     = params[:tutorial].gsub(/[^a-z_\-]/, '')
    filename     = "tutorials/#{tutorial}.markdown"
    @title       = TITLES[tutorial]
    @content     = HoboFields::MarkdownString.new(File.read("#{RAILS_ROOT}/#{filename}"))
    @last_update = last_update filename
  end

end
