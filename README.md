erDiagram
    CUSTOMER ||--o{ RENTAL : books
    CAR ||--o{ RENTAL : assigned_to
    RENTAL ||--o{ PAYMENT : generates

    CUSTOMER {
        int customer_id PK
        string name
        string email
        string phone
    }

    CAR {
        int car_id PK
        string brand
        string model
        int daily_rate
        int total_cars
    }

    RENTAL {
        int rental_id PK
        date start_date
        date end_date
        string status
        int customer_id FK
        int car_id FK
    }

    PAYMENT {
        int payment_id PK
        string payment_method
        int amount
        date payment_date
        int rental_id FK
    }
