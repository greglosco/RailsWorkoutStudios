rails project - workout studio review app

user
-has many studios.
-has many instructors, through studios
-has many reviews.
-has many studios through reviews.
    -username
    -email
    -pw_digest

studio * joining users & instructors
-has many users.
-has many reviews.
<!-- -has many reviewing users through reviews source :user -->
-has many instructor
    -name
    -category

review  * joining users & studios
-belongs to user.
-belongs to studio.
    -rating
    -content

instructor
-has many studios
-has many users through studios
    -name

rails g resource —no-test-framework
tables & models
	-console, testing — “rails c -s” (if errors, object.erros or .save!)
setup user capabilities — signup (form_for  @user do |f| — f.email_field :email, required: true (can be removed on backend), f.password_field :password ), login (form_tag), logout custom routes— put above resources routes!!
	-session controller, (has_secure_password, password_digest, bcrypt)
controllers & views
validations

create
set instance variable to user params
if @user.save
session[:user_id] = @user.id



REVIEW NOTES

authenticate so a user cannot sign in without a password

create actions -- use .new, then call save

(redirect = new HTTP request)

refactor two index routes 

add styling!!