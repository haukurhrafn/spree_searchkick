Spree::Taxon.class_eval do
  def sort_key
    "taxon_#{self.id}"
  end
end
