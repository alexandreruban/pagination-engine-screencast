module Paginate
  module Controller
    private

    def set_page_and_extract_portion_from(collection)
      @page = current_page_from(collection)
      @page.records
    end

    def current_page_from(collection)
      Paginate::Page.new(current_page_param, collection)
    end

    def current_page_param
      params[:page].to_i > 0 ? params[:page].to_i : 1
    end
  end
end
