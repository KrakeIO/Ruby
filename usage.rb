$:.unshift File.join(File.dirname(__FILE__), '/lib')

require 'krake'

########################################################################
# VALIDATE A TOKEN
########################################################################

Krake.configure do |c|
  c.token = "hunter2" # it will show to us as *********
end

puts Krake::User.valid?

########################################################################
# SUBMIT A TASK
########################################################################

mds_task = Krake::Task.new do |task|
  task.description = "scrape mds collections"
  task.origin_url  = "http://www.mdscollections.com/cat_mds_accessories.cfm"
  task.data        = { source: 'mdscollections' }
  task.columns     = [{
                         col_name: 'product_name',
                         dom_query: '.listing_product_name',
                      },{ 
                        col_name: 'product_image',
                        dom_query: 'span a img',
                        required_attribute: 'src'        
                      },{        
                        col_name: 'price',
                        dom_query: '.listing_price'
                      },{ 
                        col_name: 'detailed_page',
                        dom_query: '.listing_product_name',
                        required_attribute: 'href',
                        options: { 
                          columns: [{
                            col_name: 'product_description',
                            dom_query: '.tabfield18504'
                          }]        
                        }
                     }]
end

mds_task.submit

########################################################################
# SHOW SCRAPES
########################################################################

puts Krake::User.tasks
