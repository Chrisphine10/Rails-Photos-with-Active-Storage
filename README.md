#Readme
# Rails-Photos-with-Active-Storage

Implementation of a module for adding pictures using rails Active_Storage gem.
Below is the list of steps that are made to implement the module in the repository.

Initialize the rails application
rails new picture-module -d mysql -T

-T removes the test gem that is preinstalled. I prefer rspec.

get into the application file directory
cd pucture-module

run bundle to install the pending gems
bundle install

then create the database
rails db:create

do a database migration to get initial values to the databases created
rails db:migrate

start the server to confirm that all worked well. check out localhost:3000 in the browser
rails server/rails s

create the model, view and controller for the photo to be added. This implements scaffold which helps to do all that.
rails g scaffold photo title caption:text

migrate the values into the database
rails db:migrate

now restart the server with "ctrl + c"

make a root for you application in config/route.rb. add:
root to: 'photos#index'

check out localhost:3000

Now, add the active storage gem into your application.
rails active_storage:install

run the migration for the active storage data
rails db:migrate

add the variable for holding your photo into app/models/photo.rb
has_one_attached :photo

add the variable into the controller paramitters app/controllers/PhotosController.rb

change "params.require(:photo).permit(:title, :caption)" into:
params.require(:photo).permit(:title, :caption, :photo)

make the photo visible in the views. add the code below to app/views/photos/form.html.erb
thia will display the photo

app/views/photos/show.html.erb
<p>
  <%= image_tag(@photo.photo) %>
</p>
you can add some styling to the photo with the code below.
  
<div>
  <%= image_tag(@photo.photo, style: 'width: 200px; height: auto') %>
</div>
make the image clickable
<div>
  <%= link_to image_tag(@photo.photo, style: 'width: 200px; height: auto'), photos_path %>
</div>






