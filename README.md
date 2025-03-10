# Bank_Transaction_Schema
This is a bank transfer schema I created from scratch using dbdiagram.io where I implemented one-to-one, one-to-many, many-to-many relationship. I also created a PostgreSQL database with Postbird, where I created and inserted data into the database.
# Database Relationships
## One-to-Many (Customer to Bank Accounts)

A single **customer** (`customer_details.id`) can have multiple **bank accounts** (`account.customer_id`).  
This is a **one-to-many** relationship.

## Many-to-Many (Transactions Between Accounts)

Each **transaction** (`transaction.id`) can involve a **sender** (`transaction.sender_account_id`) and a **receiver** (`transaction.receiver_account_id`).  
Since multiple transactions can occur between multiple accounts, this represents a **many-to-many** relationship between accounts via transactions.

## One-to-Many (Branch to Customers)

A **local branch** (`local_branch.id`) can serve multiple **customers** (`customer_details.branch_id`).  
This is another **one-to-many** relationship.

## Many-to-Many (Customers and Transactions)

A **customer** can be involved in multiple **transactions**, and a **transaction** can involve multiple **customers** (e.g., joint accounts).  
The **`customer_transaction`** table correctly establishes a **many-to-many** relationship using a composite primary key (`customer_id`, `transaction_id`).
