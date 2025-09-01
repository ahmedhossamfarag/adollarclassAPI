# ADollarClassAPI API Documentation

## signup

**Method:** `POST`

**URL:** `{{baseURL}}/auth/signup`

**Request Body:**

```json
{
    "user": {
        "nickname": "Ahmed Farag",
        "email": "ahmd2@gmail.com",
        "password": "1234",
        "password_confirmation": "1234",
        "experience": "experience",
        "specialty": "specialty",
        "qualifications": "qualifications",
        "portfolio": "portfolio",
        "role": "educator"
    }
}
```

## educators

**Method:** `GET`

**URL:** `{{baseURL}}/users/educators`

## applications

**Method:** `GET`

**URL:** `{{baseURL}}/applications`

## new application

**Method:** `POST`

**URL:** `{{baseURL}}/applications`

**Request Body:**

```json
{
    "application": {
        "user_id": 1,
        "status": "pending"
    }
}
```

## update application

**Method:** `PUT`

**URL:** `{{baseURL}}/applications/1`

**Request Body:**

```json
{
    "application": {
        "status": "accepted"
    }
}
```

## signin

**Method:** `POST`

**URL:** `{{baseURL}}/auth/signin`

**Request Body:**

```json
{
    "email": "ahmd2@gmail.com",
    "password": "1234"
}
```
