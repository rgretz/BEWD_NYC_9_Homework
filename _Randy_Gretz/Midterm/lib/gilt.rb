require 'json'
require 'rest-client'
require 'pry'
require 'gilt'
require 'weary'
require 'money'
require 'multi_json'

class GiltStore
  attr_reader :store

  APIKEY = '565c04d586cdaf7f87302d8174f22372'

  def initialize(store)
    @store = store
  end

  def get_api_data
    Gilt::Sale.active_in_store({ apikey: APIKEY, store: store.to_sym })  
  end

  def display_sales(data)
    results = []
    data.each do |sale|
      results << "\n#{sale.name}: #{sale.description}\n"
    end
    results
  end
end
