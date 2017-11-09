# Comic Culture Marketplace
## https://comic-culture-marketplace.herokuapp.com
Comic Culture is a community-oriented two-sided marketplace for pop culture enthusiasts. The main target markets for this marketplace are the comic book or graphic novel readers/hobbyist, toy collectors/makers, costume makers/cosplayers, and clothing/apparel collectors/enthusiasts.


## Contents
- **[Problem](#Problem)**
- **[Solution](#Solution)**
- **[Trello Board](#TrelloBoard)**
- **[User Stories](#UserStories)**
- **[Entity Relationship Diagram](#ERD)**
- **[Models](#Models)**
- **[Controllers](#Controllers)**
- **[Mood Board](#Moodboard)**
- **[Inspiration](#Inspiration)**
- **[Wireframes](#Wireframes)**
- **[Features](#Features)**
- **[Ruby Gems](#RubyGem)**
- **[Challenges](#Challenges)**
- **[Coding](#Coding)**
- **[Optimisations](#Optimisations)**
- **[Final Product](#FinalProduct)**


## <a id="Problem"></a>Problem
Comic Culture is currently growing in popularity as the movie and television industry has been using comic-based characters and stories for their shows. As such, there is also an increase in popularity among comic books, graphic novels, toys, collectibles, costumes, clothing and other apparel. However, most online stores that sell these products only sell brand new items. As such the community has been relying on generic two-sided marketplaces such as eBay or gumtree which does not have the expertise or speciality of an online comic culture community who are much familiar with these products.


## <a id="Solution"></a>Solution
A community-oriented two-sided marketplace creates an atmosphere of expertise and enthusiasm among comic culture buyers and hobbyists. It will not only provide ample feedback to sellers, but it will also incorporate better prices for buyers as they are guided by a specialised community.


## <a id="TrelloBoard"></a>Trello Board
[Comic Culture Marketplace Trello Board](https://trello.com/b/2oLVZAu0/comic-culture-marketplace)

![](/docs/images/trello.png)
![](/docs/images/trello2.png)

My trello board is the main driver of my project management. It allowed me to plan ahead with User Stories, Models, Controllers, ERD and Wireframes. I also used it to determine the potential APIs that I am going to use as well as the gems that I need to build my rails project.

The trello board later turned into an Agile scrum board in which I managed my project to organise my Backlog, Active tasks, Tasks that are ready to be tested and the Tasks I already completed. Using Agile in this project is a very fruitful decision which leads to the proper timeboxing of my tasks.


## <a id="UserStories"></a>User Stories
My user stories are composed of 3 target markets (Guests, Buyers and Sellers). Guests are the people who have not signed up for the app are potential customers for the two-sided marketplace. Buyers and Sellers are the registered users who can benefit from all the features of the site. Since it is a two-sided marketplace, a buyer can be a seller and a seller can be a buyer.
  
### Guests
- In order to see what the marketplace is all about, as a guest, I want to search products and view listings without having to log in.
- In order to transact with other people, as a guest, I want to sign in or sign up for the service securely.
- In order to easily sign in or sign up for the service, as a guest, I want to sign in or sign up using my google account.
- In order to show myself to other users, as a guest, I want to have a profile with as much relevant information as possible.

### Buyers
- In order to easily look for the product I am looking for, as a buyer, I want to use a search function using keywords.
- In order to narrow down my search by location, as a buyer, I want to know the distance between me and the seller.
- In order to narrow down my search by category, as a buyer, I want to have search filters.
- In order to have an idea of the products I can buy, as a buyer, I want to see intuitive listings such as featured, trending items, recently added.
- In order to know the full details of a product, as a buyer, I want as much information on its show page.
- In order to organise my shopping checkout, as a buyer, I want to make use of a shopping cart.
- In order to finalise my shopping cart, as a buyer, I want to have a checkout feature to complete my transaction.
- In order to pay for the products, as a buyer, I want to make use of a payment feature which supports credit card or cash on hand payments.
- In order to let the sellers know my satisfaction with their service, as a buyer, I want to review and rate them.
- In order to see if the seller provides quality service, as a buyer, I want to see the seller's customer reviews and ratings from other buyers.
- In order to see the products I bought previously, as a buyer, I want an order history.
- In order to communicate with the seller, as a buyer, I want to message him/her directly.
- In order to organise the products I am interested in, as a buyer, I want to have a watch list.
- In order to report an issue, as a buyer, I want a support feature so I can message the marketplace administrator.
- In order to see the most interesting products, as a buyer, I want to see product views.

### Sellers
- In order to provide details about my products, as a seller, I want to provide as much details as possible such as photos, description, condition, etc.
- In order to market myself to buyers, as a seller, I want to have good customer reviews and ratings.
- In order to market my products, as a seller, I want my products to be featured when they are trending.
- In order to get paid for my products, as a seller, I want to be paid by cash or through my bank account.
- In order to organise my product listing, as a seller, I want to have item types and categories.
- In order to market my products to its potential target market, as a seller, I want buyers to have a profile which includes their favourite characters/heroes/shows.
- In order to answer inquiries about my products, as a seller, I want buyers to message me.
- In order to report an issue, as a seller, I want a support feature so I can message the marketplace administrator.
- In order to see how marketable my product is, as a seller, I want to see product views.

## <a id="ERD"></a>ERD
The ERD is the most critical part of my design and is essentially one of the biggest things I have done for my project. Planning my tables ahead gave me an idea of how I want to work with my Rails models. The join tables also allowed me to minimise my scope queries to just 2, namely, product categories and top viewed products.

![](/docs/images/erd.png)


## <a id="Models"></a>Models
```
User
- name :string
- email :string

Profile
- first_name :string
- last_name :string
- image :string
- date_of_birth :date
- short_bio :text
- superpowers :string
- favourites :string
- user_id :User
- billing_address_id :Address
- shipping_address_id :Address

Address
- house_number :string
- street_name :string
- town_suburb :string
- city :string
- state :string
- postal_code :string
- country_code :string
- latitude :decimal
- longitude :decimal

Product
- seller_id :User
- name :string
- price :decimal
- description :text
- condition :string
- status :string
- category :string
- manufacturer :string
- publisher :string
- publish_date :date
- author :string
- illustrator :string
- isbn_10 :string
- isbn_13 :string
- dimensions :string
- weight :decimal
- keywords :string
- created_at :datetime
- updated_at :datetime
- postage :string

Product View (Join Table)
- product_id :Product
- buyer_id :User

Photo
- product_id :Product
- image_data :string

Review
- seller_id :User (Seller)
- buyer_id :User (Buyer)
- comment :text
- rating :decimal

Shopping Cart
- buyer_id :User (Buyer)

Order
- buyer_id :User (Buyer)
- charge_identifier :string

Order Item (Join Table)
- order_id :Order
- product_id :Product

Watch List
- buyer_id :User (Buyer)

Watch List Item (Join Table)
- product_id :Product
- watchlist_id :Watchlist

Conversation
- topic :string
- title :string

Message
- user_id :User
- conversation_id :Conversation
- body :text

User Conversation (Join Table)
- user_id :User
- conversation_id :Conversation
```


## <a id="Controllers"></a>Controllers
```
Profiles Controller
- show
- new
- edit
- create
- update
- destroy

Products Controller
- index
- book
- show
- new
- edit
- create
- update
- destroy
- books
- toys
- costumes
- apparel

Reviews Controller
- new
- create

Conversations Controller
- index
- create
- show
- destroy

Messages Controller
- update

Support Controller
- new
- create

Order Controller
- index
- new
- create

Shopping Cart Controller
- index
- create
- destroy

Watchlist Controller
- index
- create
- destroy

Search Controller
- index

Contact Support Controller
- new
- create
```


## <a id="Moodboard"></a>Mood Board
My mood board is composed of comic book heroes, comic-related products and characters from superhero movies, tv-series and modern comic pop culture.
[Mood Board - Comic Culture Marketplace](https://www.pinterest.com.au/Gurenax/comic-culture-marketplace)

![](/docs/images/moodboard.png)


## <a id="Inspiration"></a>Inspiration
One of the inspirations behind creating this project is that none of the local marketplaces (PopCultcha and Minotaur) is two-sided. Comic Connect, on the other hand, is a two-sided marketplace but is based in New York City.

### PopCultcha
![](/docs/images/popcultcha.png)

### Minotaur
![](/docs/images/minotaur.png)

### Comic Connect
![](/docs/images/comicconnect.png)


## <a id="Wireframes"></a>Wireframes
[Comic Culture Marketplace Wireframes](https://www.figma.com/file/S3GhFLh0U5SPe2e2E5AXayhU/Comic-Culture-Marketplace)

### Lo-fi
![](/docs/images/figma-lofi.png)

### Hi-fi
![](/docs/images/figma-hifi.png)

### Mobile
![](/docs/images/mobile-wireframe.png)

### Desktop
![](/docs/images/desktop-wireframe.png)

### Colour Scheme
My original idea for my design was to have a very colourful and psychedelic colour scheme. However, this was later changed when I found that the costume of Batgirl fits really great with my design. Something about the colour of her costume appealed to me.

![](/docs/images/batgirl.jpg)


## <a id="Features"></a>Features
- Buy and Sell Products related to Comic Culture (i.e. Superheroes, Anime, Movie characters, Cosplay, anything you see from events like Comic Conventions or Toy Conventions)
- Ability to provide Reviews and Ratings to sellers to keep the community aware of the good sellers and motivate sellers to be good sellers
- Algolia Search: Product Search by keywords to ease the difficulty of browsing and finding products
- Algolia Search with Geocoder: Product Search filtered by location radius, categories, manufacturer/publisher and specific sellers
- Shopping Cart: To ensure that buyers will have a proper place to collect their products and ease the payment process by bundling everything in one checkout.
- Watchlist: To help buyers monitor the products they are interested in without having to check out the product.
- Order Confirmation and Credit Card payments with Stripe
- Direct Messaging between Users
- Devise Security and Pundit authorizations: To ensure that all user profiles and products are secure and are only modifiable by their owners.


## <a id="RubyGem"></a>Ruby Gems I used in this Project
- Devise
- Annotate
- Rspec-rails 3.6
- Shoulda-matchers
- Mailgun-ruby
- County_select
- Aws-sdk 1.3
- Fastimage
- Image_processing
- Mini_magick
- Shrine
- Stripe
- Alogilasearch-rails
- Geocoder
- Bootstrap 4
- JQuery-rails
- Font-awesome-rails
- Pundit
- Recaptcha
- Possessive


## <a id="Challenges"></a>Challenges
- My postgresql was accidentally updated from v9.6 to v10.0 which prevented me from starting my rails development server. I had to look for a fix to proceed with my development. Fortunately, I found that this is a common issue among some developers and I found the solution here: https://gist.github.com/giannisp/ebaca117ac9e44231421f04e7796d5ca
![](/docs/images/postgresql-error.png)

- Time boxing my all tasks was such a big challenge even though I am using an agile scrum board.

- Figuring out how to do the Shopping Cart properly (i.e. When a user adds a product to his/her shopping cart, does the product become unavailable for other users? ..Or will the product be available to all users and the item just automatically gets deleted from the person's shopping cart when someone else buys it? )

- Figuring out the proper way of implementing join tables.

Wrong:
```
ShoppingCartItem < ApplicationRecord
  has_one :product
  has_one :shopping_cart
```
Correct:
```
ShoppingCartItem < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart
```

Wrong:
```
Person < ApplicationRecord
  has_one :mom
  has_one :dad
```
Correct:
```
Person < ApplicationRecord
  belongs_to :mom
  belongs_to :dad
```
- Test-driven development ate a lot of my project time but it ensured the integrity of the most critical parts of my app.


## <a id="Coding"></a>Coding

### Test Driven Development
I used RSpec to perform test-driven development with my project and was able to perform them in my Model classes and Helper classes. I tried my best to write good tests but as soon as I figured that I am running out of time, I had to make a decision to only write TDD for the most important parts of the app. Given more time with the project, I would try to write tests on everything.

### Applying the ERD to my Models
The most challenging part of creating my Rails models is figuring out if my ERD is correct, to begin with. As I was coding my models and creating tables, I found out that some of my join tables were wrong and I had to redo them to achieve the proper associations. In the end, creating my models properly saved me a lot of headaches as everything just fits into place.

### Applying the wireframe design to the Front-end
Bootstrap saved me a lot of time by making use of its Grid and Flexbox features. Despite using bootstrap, I was still able to achieve the look and feel of my wireframe. I also had to make adjustments to a lot of pages as they fit better in a responsive design.

### Mobile First Approach
To ensure that my web app will run correctly on mobile devices, I used the iPhone simulator from X-Code. I was also using Chrome developer tools to ensure that it works the same for Android devices. In the end, I was able to achieve a proper responsive design with the help of bootstrap grid and flexbox.


## <a id="Optimisations"></a>Optimisations

### Fonts and Font Sizes
I had to make late adjustments to my fonts to ensure readability of the texts. My app's logo was changed from Bangers to Oswald as there was already too much of the Bangers font in my pages itself. I also had to change my the font of my main texts from Oswald to PT Sans as the Oswald font is not very readable below 16px. Lastly, I had to make sure that the font sizes fit with PT Sans so I had to change the font sizes in some areas.


### DRY (don't repeat yourself)
Before: `Not so DRY`
```ruby
  ### Controller (ProductsController.rb)
  @comics = Product.where(category: 'Comic Books & Graphic Novels', status: 'Available').order(created_at: :desc)
  @toys = Product.where(category: 'Toys & Collectibles', status: 'Available').order(created_at: :desc)
  @costumes = Product.where(category: 'Costumes', status: 'Available').order(created_at: :desc)
  @apparel = Product.where(category: 'Clothing & Apparel', status: 'Available').order(created_at: :desc)
```

After: `A DRYer solution to querying product categories`
```ruby
  ### MODEL (Product.rb)
  # Query product by Category and Available
  scope :category, ->(category) {
    Product.where(category: category, status: 'Available').order(created_at: :desc)
  }

  ### Controller (ProductsController.rb)
  @comics = Product.category('Comic Books & Graphic Novels')
  @toys = Product.category('Toys & Collectibles')
  @costumes = Product.category('Costumes')
  @apparel = Product.category('Clothing & Apparel')
```

### Faster query
Before: `Run Time (19.4ms)`
```ruby
  ### MODEL (Product.rb)
  # Count the Product Views
  def view_count
    product_views.count
  end

  ### CONTROLLER (ProductsController.rb)
  @top_products = Product.where(status: 'Available').sort_by(&:view_count).reverse[0,12]
```

After: `Run Time (1.5ms)`
```ruby
  ### MODEL (Product.rb)
  # Query list of top products
  scope :top_products, ->(up_to_rank){
    # Find an array of top viewed products sorted in descending order
    array_of_products = Product.where(status: 'Available').left_joins(:product_views).group(:product_id).count(:buyer_id).sort_by{|k,v| v}.reverse.to_h.keys[0,up_to_rank]
    
    # Get these array of Products while preserving sort order of array
    Product.where(id: array_of_products).index_by(&:id).slice(*array_of_products).values
  }

  ### CONTROLLER (ProductsController.rb)
  @top_products = Product.top_products(12)
```

### Rubocop
- I did not have enough time to fix all the Rubocop offenses.
- As of date, I have `229 files inspected, 2347 offenses detected` in rubocop.


## Deploying to Heroku
I only had minor issues when I deployed to Heroku and was able to get the site completely running in just a few hours. In addition, I was able to customise my heroku app name using the command `heroku apps:create comic-culture-marketplace`.

### Algolia Search
One of the issues I had with Heroku was figuring out a way on how I can re-index my Products model with `Product.reindex`. I later figured out that I can do this in my seeds file which I can run on demand.


## <a id="FinalProduct"></a>Final Product

![](/docs/images/iphonex.png)

![](/docs/images/desktop.png)