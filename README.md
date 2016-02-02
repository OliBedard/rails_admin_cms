# RailsAdminCMS

*Flexible Content Management Framework for RailsAdmin*

## Overview

RailsAdmin...

## View helpers

There is an example of a common template using some of the cms view helpers:

```ruby
<!DOCTYPE html>
<html>
<head>
  <title><%= title = cms_title('AppRailsAdminCMS') %></title>
  <%= cms_meta_data_tags %>
  <%= cms_meta_og_tags(title) %>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body class="<%= cms_body_class('shop', 'cart') %>">

<%= cms_flash_messages %>
<div>
  <%= cms_locale_selector %>
</div>
<div>
  <%= cms_link_to_edit_mode if current_admin? %>
</div>

<%= yield %>

</body>
</html>
```

What's going on:

1. `cms_title` outputs a title tag defined by either a view element or a default one passed as argument
1. `cms_meta_data_tags` outputs the meta keywords + description tags defined by either a page/form object or a complete default one passed as argument
1. `cms_body_class` outputs 
1. `cms_flash_messages`
1. `cms_locale_selector`
1. `cms_link_to_edit_mode`
1. `current_admin?`

## Mailchimp

First, `mailchimp_api_key` and `mailchimp_list_id_en` (and `mailchimp_list_id_xx` where `xx` is the locale) need to be defined within `config/secrets.yml`.
Then, use the partial `app/views/cms/shared/_mailchimp.html.erb` to output the mailchimp form:

```ruby
<%= render 'cms/shared/mailchimp' %>
```

1. Flash messages could be overriden by the keys `flash_messages.mailchimp.subscribe.(success|error)`.
1. Input placeholder could be overriden by the key `simple_form.placeholders.mailchimp.email`. 
1. Input and submit button are wrapper in a div tag with the class `cms-mailchimp`. 

## TODO

* Documentation
* Generators
* Setup CanCanCan
* Setup Globalize on Form::Field and Form::Email
* Improve breadcrumbs functionality
* Link to image edit in edit form (for cropping)
* Confirmation email for forms
* Published Pages/Forms
* Redirector
* Setting fetched from Yaml file
* Pretty Url for Viewable::LinkPresenter#url as file_url
* Fetch image size based on Screen size
* More Specs

## Notes

gem 'dalli-delete-matched' needed if Memcached is used


This project rocks and uses MIT-LICENSE.
