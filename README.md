# Core Usage Dummy App - Sprockets Approach

This app demonstrates the simplest approach to use Basemate::Ui::Core without any bundle or theme in charge. Assets are compiled and served only with sprockets. Webpacker is not installed. This makes it very easy to integrate without any further dependencies. It is not recommend if you want to extend Basemate through building your own components; you should use Webpacker instead.

## Setup

### Gemfile

Add 'basemate-ui-core' to your Gemfile

Gemfile
```ruby
gem 'basemate-ui-core'
```

and run bundle install.

### Javascript

Add 'basemate-ui-core' to your application.js

assets/javascript/application.js
```
//= require basemate-ui-core
```

### Basemate Folder

Create a folder called 'basemate' to your app directory. All your Basemate apps, pages, components will be defined there.

### Include Helper

Include the Basemate Helper to your controllers. If you want to make the helpers available in all controllers, include it to your 'ApplicationController' like:

controllers/application_controller.rb
```ruby
class ApplicationController < ActionController::Base
  include Basemate::Ui::Core::ApplicationHelper
  #...
end

```

## Usage

### Create a Basemate Page
Scenario: You want to use a Basemate Page instead of a classic Rails view as a response for your controller action.
Your setup would be:

Your routes:

config/routes.rb
```ruby
Rails.application.routes.draw do
  get '/home', to:'landing_page#home'
end
```

Your Controller Action:

app/controllers/landing_page_controller.rb
```ruby
class LandingPageController < ApplicationController

  def home
    @foo = "foo"
    @bar = "bar"
    responder_for(LandingPage::Home)
  end

end

```

Your Basemate Page:

app/basemate/landing_page/home.rb
```ruby
module LandingPage
  class Home < Page::Cell::Page

    def response

      components {
        row do
          col do
            plain @foo
          end
          col do
            plain @bar
          end
        end
      }

    end

  end
end

```
This gives you following output:

```html
<div class='row'>
  <div class='col'>
    foo
  </div>
  <div class='col'>
    bar
  </div>
</div>
```
Note:
- "row", "col", "plain" are predefined core components
- you can customize the output of the core components (see: ...)
- you can add your own components (see: ...)
- you can use components from basemate bundles (see: ...)

## Customize Core Components

Add a ruby file to the correct basemate customize folder, for example:

basemate/customize/ui/core/row.rb
```ruby

module Customize::Ui::Core
  class Row

    def row_classes(classes, options)
      classes << "justify-content-md-center" if options[:center] == true
    end

  end
end
```

and change your Basemate Page to use your new interface:

app/basemate/landing_page/home.rb
```ruby
module LandingPage
  class Home < Page::Cell::Page

    def response

      components {
        row center: true do
          col do
            plain @foo
          end
          col do
            plain @bar
          end
        end
      }

    end

  end
end

```
This gives you following, customized output:

```html
<div class='row justify-content-md-center'>
  <div class='col'>
    foo
  </div>
  <div class='col'>
    bar
  </div>
</div>
```
