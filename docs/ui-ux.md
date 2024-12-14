# Polaris UI Design

## Pages

### Sales Home

- Salesman login
    - Display a list of salesman profiles (name, picture/logo)
    - Select a name from list
    - Type salesman pin number before entering sales home

#### Logged-in view tabs

- Item search
    - Search item by id
    - Search item by brand
    - Search item by color
    - Search item by size
    - Search item by type
    - Search item by combo of above
    - Add to current sale
    - Move item location
        - Put in holds

- Transactions
    - Create new transaction button
    - List all transactions that are currently open
    - List all past transactions for current salesman

#### Sales Flow
After the create new transaction button is clicked each step will be a new page
in the process of making a sale. Each page should have a "suspend" button that will
log out the current salesman and return them to the sales login page.

1. Initiate a transaction (this should be a button on the sales home page)
    - Mark sale type (sale, order/transfer, return)
2. Gather customer info (name, phone, email, maybe adress)
    - If sale is transfer specify from- and to-store instead
3. Add items to sale (item search)
    - Search an item then click "add"
    - Allow editing the quantity of an item in the transaction
    - Add comments, alterations, promise date etc.
4. Payment
    - itemized prices
    - subtotal
    - total after tax
    - apply authorized sales

### Alterations Home
- Queue of upcoming alterations
    - Edit requirements for an alteration
    - Move alteration to WIP
    - Move alteration to Complete
- View past/completed alterations
- View backlog of upcoming alterations

### Management Home
- Go to past sales
- Add items to stock
- Remove items from stock
- Audit stock for an item
- Audit stock for all items
- See charts of key metrics
    - Overall stock numbers
    - Overall sales numbers
    - Stock by item
    - Sales by item
    - All of these over adjustable timetables

