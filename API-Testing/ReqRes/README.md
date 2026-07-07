# ReqRes API Testing (Postman)

This project demonstrates API testing using Postman with the ReqRes API.

## API

This project uses the **ReqRes** REST API for testing.

Website:
https://reqres.in/

## Technologies
- Postman
- REST API
- JSON
- JavaScript (Postman Tests)

## Features
- Environment Variables
- Pre-request Script
- Post-response Script
- Automated API Tests

## Requests
- ✅ GET - List Users
- ✅ POST - Create User
- ✅ PUT - Update User
- ✅ PATCH - Partial Update User
- ✅ DELETE - Delete User

## Automated Tests
- Status code validation
- Response time validation
- JSON structure validation
- Data type validation
- Pagination validation

## Environment Variables
- `baseUrl`
- `apiKey`

## Pre-request Script

Automatically adds the API key to every request:

```javascript
pm.request.headers.add({
    key: "YOUR_API_KEY",
    value: pm.environment.get("apiKey")
});
```

## Post-response Script

Runs automated validations after each request.

## Example Test

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});
```

## Result

The collection demonstrates CRUD operations, reusable environment variables, automated tests, and pre-request scripting using Postman.
