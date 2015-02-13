# LightMobile

## Installation


### Gemfile

Add to your Gemfile and bundle.

```ruby
gem "light_mobile"
```

### ApplicationController

Add this include to your ApplicationController.

```ruby
class ApplicationController < ActionController::Base
  include LightMobile::DynamicRenderer
end
```

### MimeTypes

Add this to "config/initializers/mime_types.rb":

```ruby
require "light_mobile/mime_types"
```

### CSS

Add a new file "app/assets/stylesheets/application_mobile.css.scss":

```scss
/*
 *= require light_mobile/buttons
 *= require light_mobile/menu
 *= require light_mobile/simple_form
 *= require light_mobile/tables
*/
```

### JavaScript

Add a new file "app/assets/javascripts/application_mobile.js.coffee":
```coffee
#= require light_mobile/menu
```

## Usage

### Tabs

```haml
= mobile_tabs do |tabs|
  - tabs.tab label: "Details", id: "tab-details", active: true
  - tabs.tab label: "Comments", id: "tab-comments"
  - tabs.tab label: "Assigned Users", id: "tab-assigned-users"

#tab-details This is the details
#tab-comments This is the comments
#tab-assigned-users This is the assigned users
```

### Flash errors

In beginning of the body-element do something like this:
```haml
%body
  - if flash.any?
    .mobile-flash-messages
      - flash.each do |flash_type, message|
        .mobile-flash{class: "mobile-flash-#{flash_type}"}
          = message
          = link_to _("OK"), "#", class: ["mobile-button", "mobile-flash-ok"]
```

## License

This project rocks and uses MIT-LICENSE.
