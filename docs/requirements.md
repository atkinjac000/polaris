# Requirements for the Polaris Project

## Features

### Must-Haves

- Tracks stock of all items in the store
    - Reports quantity of any item in the store upon request
        - Can see sale price of any item as well as any active discounts
    - Can give the location of any tracked item in the store upon request
        - Any item going into alterations becomes a tracked item
    - Allows for inventory audits
        - Can report actual quantities for items
        - Discrepancies will be reported to managers
- Tracks sales of any item in the store
    - Sales are tracked on a per-salesman basis
    - Statistics are compiled into reports upon admin demand
    - Sales statistics for a salesman are viewable only by that salesman and their manager(s)
    - Can calculate cost of a sale based on item sale prices
        - Item sale prices will be adjustable within a window of approved salesman leeway
        - Managers can overwrite sale price windows
    - Allows customer to input phone number/e-mail and name for sale
    - Can calculate commission on a per-salesman basis
    - Can see past sales for 90 days
        - Can see the salesman who made the sale
        - Can leave notes on a sale
        - Can see items sold
        - Can see alterations made
        - Can mark sale for non-deletion after 90 days
- Maintains a queue of items to be altered
    - Can sort alterations by priority to maximize throughput of alterations
    - Reports a promise day of alteration upon sale of an item
    - Can mark items as WIP
    - Can mark items as Done
- Low stock warnings
    - Can set low stock limits on a per-item basis
    - Will notify managers when a low stock limit is reached
- This will be implemented as a web-site accessible from devices stationed at the
store

### Nice-to-Haves

- Sends e-mail notifications when items are complete
    - Sales system allows customer to input e-mail
- AI powered order suggestions
    - Sales data and stock data is aggregated and used to train an AI
    - The AI will predict stock needs and prompt managers with items to order ahead
- Salesmen can set personal sales goals and track progress
- Managers can set store-wide or shift-wide sales goals and track each salesman's progress
- An app available to salesmen that makes price checking easier
- Fuzzy search for items
- Item barcode add to sale

### Will-Not-Haves

- Point-of-sale system / payment system
- Online catalog / e-commerce site
