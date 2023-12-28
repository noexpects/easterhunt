## **[Task conditions](https://docs.google.com/document/d/1lwvcpYyWXOJZ1iluWzrWPkXShnSfKWYIEyj0HYSvBuY/edit)**

Design and implement a RESTful API that allows users to participate in an Easter Egg Hunt by retrieving clues and finding hidden eggs within a given area.
Each Easter Egg has a unique 8-character code written on it and this code is required for a Hunter to mark the Egg as found.

### Rails version: 7.0.8
Ruby version: 3.2.1

### How to run this project
1) Clone the repo
2) Run `bundle install`
3) Configure `database.yml` to match your PG credentials
4) Run `rails db:create db:migrate db:seed`
5) Run `rails s`

### Usage
For communication with API using HTTP client is recommended. Postman, Insomnia, etc.

### Credentials
#### Admin account: 
    email: admin@admin.com 
    password: password
#### Hunter account: 
    email: hunter@hunter.com 
    password: `password'
#### Admin panel access(/admin_panel):
    name: admin 
    password: admin
### Testing
`rspec` gem used for project testing. Coverage 100%.
