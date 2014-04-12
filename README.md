# Making Rails Api - A demo application

## Format of requests

### Registration

* curl -i -H "Accept: application/json" -d "user[email]=user_email&user[password]=user_password" http://localhost:3000/api/v1/registrations.json

### Confirmation

* curl -i -H "Accept: application/json" -d "confirmation_token=confirmation_token" http://localhost:3000/api/v1/confirmations

### Login

*  curl -i -d "user_login[email]=user_email&user_login[password]=user_password" http://localhost:3000/api/v1/sign_in.json

### Logout

 * curl -H "Accept: application/json"   -H "Authentication-Token: user_token" -X DELETE  http://localhost:3000/api/v1/sign_out.json

### List the tasks of user

* curl -i -H "Accept: application/json" -H "Authentication-Token: user_token"     http://localhost:3000/api/v1/tasks.json

### Create task for user

* curl -i -H "Accept: application/json" -H "Authentication-Token: user_token"     http://localhost:3000/api/v1/tasks.json

### Access task details

* curl -i -H "Accept: application/json" -H "Authentication-Token: user_token" http://localhost:3000/api/v1/tasks.json/<task_id>
