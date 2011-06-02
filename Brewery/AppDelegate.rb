#
#  AppDelegate.rb
#  Brewery
#
#  Created by Andrew Nesbitt on 29/03/2011.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

HOMEBREW_BREW_FILE = ENV['HOMEBREW_BREW_FILE'] = '/usr/local/bin/brew'

require 'pathname'
HOMEBREW_LIBRARY_PATH = Pathname.new('/usr/local/bin/brew').realpath.dirname.parent.join("Library/Homebrew").to_s

$:.unshift(HOMEBREW_LIBRARY_PATH)
require 'global'


class AppDelegate
    attr_accessor :window
    attr_accessor :kegs, :keg_table

    def applicationDidFinishLaunching(a_notification)
        @kegs = HOMEBREW_CELLAR.children.select{ |pn| pn.directory? }

        keg_table.dataSource = self
        keg_table.doubleAction = "preview:"
    end

    def windowWillClose(sender);
        exit;
    end

    def numberOfRowsInTableView(view)
        kegs.size
    end

    def tableView(view, objectValueForTableColumn:column, row:index)
        keg = kegs[index]
        id = column.identifier
        case id
        when 'name'
            keg.basename.to_s
        when 'version'
            keg.children.select{ |pn| pn.directory? }.map{ |pn| pn.basename.to_s }.join(', ')
        end
    end
end

