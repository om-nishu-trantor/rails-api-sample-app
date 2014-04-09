### Making Rails Api - A demo application

## Example requests

# Login
*  curl -i -d "user_login[email]=<user_email>&user_login[password]=<user_password>" http://localhost:3000/api/v1/sign_in.json

# Logout

# List the tasks of user
* curl -i -H "Accept: application/json" -H "Authentication-Token: <user_token>"     http://localhost:3000/api/v1/tasks.json

# Create task for user
* curl -i -H "Accept: application/json" -H "Authentication-Token: <user_token>"     http://localhost:3000/api/v1/tasks.json
