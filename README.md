# YellowBrickRoad Database Design

This project contains the database schema for the YellowBrickRoad app, designed to connect homeless individuals with real-time resources.

## 1. User Table
This table stores information for the app's users.

**SQL Code:**
```sql
CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_joined DATE DEFAULT SYSDATE
);

CREATE TABLE Resources (
    resource_id NUMBER PRIMARY KEY,
    resource_name VARCHAR(255) NOT NULL,
    resource_type VARCHAR(100),  -- e.g., 'Shelter', 'Food Bank', 'Medical'
    address VARCHAR(255),
    phone_number VARCHAR(20),
    allows_pets NUMBER(1) DEFAULT 0, -- 0 for No, 1 for Yes
    allows_couples NUMBER(1) DEFAULT 0 -- 0 for No, 1 for Yes
);

CREATE TABLE Services (
    service_id NUMBER PRIMARY KEY,
    service_name VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    contact_person VARCHAR(100)
);
