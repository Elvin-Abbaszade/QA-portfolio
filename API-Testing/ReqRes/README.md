# ReqRes API Testing (Postman)

This project demonstrates API testing using Postman with the ReqRes API, covering CRUD operations, environment variables, pre-request scripts, and automated test validations.

## API

This project uses the **ReqRes** REST API for testing.

Website: https://reqres.in/

> ⚠️ As of 2026, ReqRes requires an `x-api-key` header for all requests.
> Sign up for a free key at https://reqres.in/signup

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

|    Method  |       Endpoint      |     Description     |
|------------|---------------------|---------------------|
| ✅ GET    | `/api/users?page=2` | List Users          |
| ✅ POST   |    `/api/users`     | Create User         |
| ✅ PUT    |  `/api/users/{id}`  | Full Update User    |
| ✅ PATCH  |  `/api/users/{id}`  | Partial Update User |
| ✅ DELETE |  `/api/users/{id}`  | Delete User         |

## Environment Variables

|  Variable |     Description     |
|-----------|---------------------|
| `baseUrl` | `https://reqres.in` |
|  `apiKey` | Your ReqRes API key |

## Pre-request Script

Automatically adds the API key header to every request:

```javascript
pm.request.headers.add({
    key: "x-api-key",
    value: pm.environment.get("apiKey")
});
```

## Automated Tests

### Status Code Validation

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});
```

### Response Time Validation

```javascript
pm.test("Response time is less than 1000ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(1000);
});
```

### JSON Structure Validation

```javascript
pm.test("Response has required fields", function () {
    const json = pm.response.json();
    pm.expect(json).to.have.property("data");
    pm.expect(json).to.have.property("page");
});
```

### Data Type Validation

```javascript
pm.test("Data types are correct", function () {
    const json = pm.response.json();
    pm.expect(json.page).to.be.a("number");
    pm.expect(json.data).to.be.an("array");
});
```

### Pagination Validation

```javascript
pm.test("Response has pagination fields", function () {
    const json = pm.response.json();
    pm.expect(json).to.have.property("page");
    pm.expect(json).to.have.property("total_pages");
    pm.expect(json).to.have.property("per_page");
});
```

## PUT vs PATCH

|   PUT    |                           PATCH                               |
|----------|---------------------------------------------------------------|
|  Type    |                   Full update | Partial update                |
|  Body    |           All fields required | Only changed fields           |
|  Example | `{ "name": "Elvin", "job": "QA" }` | `{ "job": "Senior QA" }` |

## Screenshots

![GET Request](./Screenshots/get-request.png)
![POST Request](./Screenshots/post-request.png)
![PUT Request](./Screenshots/put-request.png)
![PATCH Request](./Screenshots/patch-request.png)
![DELETE Request](./Screenshots/delete-request.png)

## Result

The collection demonstrates full CRUD operations with reusable environment variables, automated test assertions, and pre-request scripting using Postman.
