class RecordingsController < ApplicationController
  def index
    @recordings = set_page_and_extract_portion_from Recording.all
  end
end
