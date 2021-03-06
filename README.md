# Background
Monocular, a business-to-business software as service application, provides its customers custom data derived from the interactions between their websites and users. This data allows the customer to make improvements to a website, resulting in a better user experience and potential for an improved bottom line.

The application is easy to use, requiring a simple JavaScript drop-in to allow the customer to begin tracking users. Monocular utilizes a REST API to receive data from the customer’s website, and stores it within a database on a secure server. This data becomes available to the customer using the web application.

# The Stack
Monocular is built with Ruby on Rails and is currently hosted on Heroku at [monocular.herokuapp.com](monocular.herokuapp.com). Monocular uses PostgreSQL as a database. However, it is trivial to configure Monocular to use your preferred database, for more info visit this [link](http://guides.rubyonrails.org/configuring.html#configuring-a-database).

# Installation
### Install Rails
You can find a good guide on how to install Rails [here](http://railsapps.github.io/installing-rails.html). Once you install Rails follow the instructions below.

### Run these commands
    git clone https://github.com/dioms/monocular.git monocular
    cd monocular
    bundle install
    rake db:migrate
    rails server (to run a local server on your computer)
