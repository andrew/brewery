#
#  SearchController.rb
#  Brewery
#
#  Created by Andrew Nesbitt on 30/03/2011.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

require 'cmd/search'

class SearchController < NSWindowController
    attr_accessor :search_field, :results_table, :results
    
    def init
        self.results = []
        super
    end

    def install(sender)
       puts 'install'
    end

    def search(sender)
        self.results = Homebrew.search_brews(search_field.stringValue).to_a
        self.results_table.reloadData
    end

    def numberOfRowsInTableView(view)
        results.size
    end
    
    def tableView(view, objectValueForTableColumn:column, row:index)
        results[index]
    end
end