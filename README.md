# Paginate

This repository is the source code of a pagination engine we will build in a screencast. The goal of the screencast is to learn to create Ruby on Rails engines and more specifically:

- Create a Rails engine with the `rails plugin new` command.
- Use the `Railtie` class to extend the Ruby on Rails framework.
- Test our Rails engine with the help of the `test/dummy` application.

By the end of the screencast, you should be able to create your own Rails engines!

## Usage

Our pagination engine provides the `set_page_and_extract_portion_from` method you can use inside your controllers to paginate a collection of records:

```rb
# app/controllers/recordings_controller.rb

class RecordingsController < ApplicationController
  def index
    @recordings = set_page_and_extract_portion_from(Recording.all)
  end
end
```

In the view, it gives you access to a `@page` object you can use to link to the previous/next page:

```erb
<%# app/views/recordings/index.html.erb %>

<h1>Recordings</h1>

<%= render @recordings %>

<% unless @page.first? %>
  <%= link_to "Previous page", root_path(page: @page.previous_param) %>
<% end %>

<% unless @page.last? %>
  <%= link_to "Next page", root_path(page: @page.next_param) %>
<% end %>
```

## Credits

This engine's API is heavily inspired by the [geared_pagination][] open-source gem developed by the Basecamp team. Check the code to see how a real-world pagination engine works!

[geared_pagination]: https://github.com/basecamp/geared_pagination
