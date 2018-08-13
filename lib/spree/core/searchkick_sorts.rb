module Spree
  module Core
    module SearchkickSorts
      def self.applicable_sorts
        {
          'featured' => { sort: { list_position: :asc }, label: 'Featured' },
          'relevance' => { sort: { _score: :desc }, label: 'Relevance' },
          'popularity' => { sort: { conversions: :desc }, label: 'Popularity' },
          'price_asc' => { sort: { price: :asc }, label: 'Price Low to High' },
          'price_desc' => { sort: { price: :desc }, label: 'Price High to Low' },
          'newest' => { sort: { created_at: :desc }, label: 'Newest' }
        }
      end

      def self.current_sort(params, taxon = nil)
        sort = SortManager.new(params, taxon).active_sort
        sort[:label]
      end

      def self.process_sorts(params, taxon = nil)
        sort = SortManager.new(params, taxon).active_sort
        sort[:sort]
      end
     end
  end
end
