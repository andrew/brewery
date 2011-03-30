#
#  MyController.rb
#  Brewery
#
#  Created by Andrew Nesbitt on 30/03/2011.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#


class MyController < NSWindowController
    attr_writer :button
    def clicked(sender)
        puts "Button clicked!"
    end
end