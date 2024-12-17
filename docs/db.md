# Database Considerations for Polaris

## Tables Needed

### Users
- id: integer
- role: string (salesman, tailor, manager)
- name: string
- pin: integer

### Items
- id: integer
- type: string
- brand: string
- color: string
- size: string
- price: float

### Sales
- id: integer
- salesman: integer (foreign-key Users)
- customer-name: string
- customer-email: string
- date: datetime
- amount: float

### Orders
- id: integer
- from-store: string
- to-store: string
- promised: datetime

### Alterations
All of the alteration measurements will be stored as a string so that they can be
recorded as "to mark" if they were marked instead of measured and display a measurement
otherwise.

- id: integer
- complete: boolean
- promised: datetime
- priority: integer
- comments: string
- hem-type: string
- waist: string
- hem: string
- sleeve: string
- sides: string 

### Sales-Items
- sale-id
- item-id 

### Sales-Orders
- sale-id
- order-id

### Sales-Alterations
- sales-id
- alteration-id

### Sales-Users
- sale-id
- user-id

### Alterations-Items
- alteration-id
- item-id

### Alterations-Users
- alteration-id
- user-id

