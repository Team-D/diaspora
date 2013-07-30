class SearchController < ApplicationController

 before_filter :authenticate_user!, :except => [:show, :last_post]

  def index
    if search_query.starts_with?('#')
      redirect_to tags_path(:q => search_query)
 
    else
      redirect_to people_path(:q => search_query)
      end
  end

  def search_query
    @search_query ||= params[:q] || params[:term] || ''
  end

end
