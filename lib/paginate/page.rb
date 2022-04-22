module Paginate
  class Page
    PER_PAGE = 30

    attr_reader :number, :collection

    def initialize(number, collection)
      @number = number
      @collection = collection
    end

    def records
      collection.limit(limit).offset(offset)
    end

    def first?
      number == 1
    end

    def last?
      page_count <= number
    end

    def next_param
      number + 1
    end

    def previous_param
      number - 1
    end

    private

    def limit
      PER_PAGE
    end

    def offset
      PER_PAGE * (number - 1)
    end

    def page_count
      (collection.count.to_f / PER_PAGE).ceil
    end
  end
end
