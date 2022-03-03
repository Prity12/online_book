class ElasticSearchReindexJob < ApplicationJob
  queue_as :default

  def perform(class_name)
    begin
      class_name.constantize.reindex
    rescue Exception => e
      puts "=== EXCEPTION on ElasticSearch ==="
      puts e.message
    end
  end
end
