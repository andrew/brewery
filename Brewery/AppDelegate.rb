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

    def windowWillClose(sender);
        exit;
    end
end

