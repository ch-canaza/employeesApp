# EmployeeApp


* Ruby version:  
  ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]  

* Rails version:  
  Rails 6.1.3  

* Aditional gems  

* Database creation  
  > Employees:  
   t.datetime "created_at", precision: 6, null: false  
    t.datetime "updated_at", precision: 6, null: false  
    t.string "full_name"  
    t.string "last_names"  
    t.string "phone_number"  
    t.string "email"  
    t.string "position"  
    t.decimal "salary"  
    t.string "department"  

* Database initialization  
  rails db:migrate

* Usage:  
  * Allows to add employees through a form with the following info:  
  - full name  
  - last names  
  - phone (11 digits)  
  - email  
  - position  
  - salary ($ 000.000.000,00)   
  - department (you can choose it from some options displayed on a selection field)  

  * Allows the user to add info from CSV files  
  * Allows the user to download info into CSV format  


* ...
# employeesApp
