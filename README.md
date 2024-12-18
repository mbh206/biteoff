# README

**BiteOff
Project Description**

a. Project Name:
BiteOff

b. What the Project Does:
BiteOff is a platform designed to help users explore, share, and experience unique culinary offerings. Whether it’s discovering a hidden gem of a local restaurant, sharing your own recipes, or connecting with fellow food enthusiasts, BiteOff brings people together over their love of great food. Users can browse curated meal suggestions, rate and review dishes, and connect with others who share similar tastes.

c. Target Users:
Food Adventurers: Individuals eager to explore new flavors, cuisines, and dining experiences.
Home Chefs & Restaurateurs: Those who want to share their creations, increase their visibility, or gather feedback from a broader audience.
Food Communities & Enthusiast Groups: Anyone looking to connect with like-minded food lovers, exchange tips, and recommend local specialties.

d. How It Works:
Landing Page: Introduces new users to what BiteOff is all about: discovering and sharing culinary delights.
Browse & Search: Users can explore a range of dishes, restaurants, and recipes. An intuitive search bar and filters help narrow down options based on cuisine type, location, popularity, or ratings.
Dish & Restaurant Pages: Each listing provides detailed information—ingredients, preparation details, location, user reviews, and helpful tips.
User Accounts & Dashboards:
Food Explorers: Track favorite dishes, maintain personal wishlists, and leave reviews.
Creators & Hosts: Manage listings, respond to inquiries, and update menus or recipes.
Community Interaction: Users can follow others, comment on dishes, join discussion threads, and exchange recommendations, fostering a vibrant, food-focused community.

e. Technologies Used & Why:
Ruby on Rails: Offers a structured MVC framework, rapid development, and a robust ecosystem, making it ideal for building a scalable and maintainable application.
HTML & CSS: Provides a semantic, responsive layout and clean, visually appealing design.
JavaScript: Adds interactivity, enhances search/filter functionality, and enables dynamic content updates without reloading pages.

**Installation & Running the Project
Prerequisites**
Ruby: Ensure Ruby (version 2.7 or higher) is installed on your system.
Rails: Rails (version 6.0 or higher) is required.
Bundler: Typically included with Ruby, used to manage and install project dependencies.
Database: A running instance of PostgreSQL or a supported database is recommended.

**Steps to Install**
Clone the Repository:
git clone https://github.com/mbh206/biteoff.git
cd biteoff

Install Dependencies:
bundle install
yarn install

Set up the Database:
Update the config/database.yml file with your database credentials. Then run:
rails db:create
rails db:migrate
rails db:seed
The db:seed command may populate initial data if provided.

Run the Server:
rails server
Visit http://localhost:3000 in your browser to view the application.

Additional Notes
Environment Variables:
If the application relies on API keys, third-party services, or secrets, ensure they’re properly configured in .env or via environment variables.

Testing:
To run the test suite (if available):

rails test
Deployment:
For deploying to production, follow standard Rails deployment steps:

Ensure you have a production-ready database.
Precompile assets with rails assets:precompile.
Set environment variables and secrets as needed.
Deploy using your chosen method (e.g., Heroku, AWS, DigitalOcean).
Enjoy discovering, sharing, and savoring new culinary adventures with BiteOff!
