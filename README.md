# MySQL-project
## Supply Chain Database
### Overview
This project implements a relational database for managing supply chain operations using MySQL. The database is designed to handle essential components of a supply chain, including customers, orders, order items, products, and suppliers.
### EER diagram for this dataset
![Supply Chain eer diagram](https://github.com/user-attachments/assets/6efa5408-24b1-40b4-938a-a1e31c6c5b96)
- An Enhanced Entity-Relationship (EER) diagram is an advanced version of the traditional Entity-Relationship (ER) diagram that includes additional concepts to represent more complex data relationships. EER diagrams extend the basic ER model by incorporating features like subclasses, superclasses, specialization, generalization, and categories. This allows for a more nuanced representation of real-world entities and their relationships, facilitating a better understanding of the underlying data structure.
### DATA description 
#### Entities
##### Customer

###### Attributes:
  - Id: Unique identifier for the customer (Primary Key).
  - FirstName: Customer's first name.
  - LastName: Customer's last name.
  - City: City of residence.
  - Country: Country of residence.
  - Phone: Contact phone number.
##### Orders

###### Attributes:
  - Id: Unique identifier for the order (Primary Key).
  - OrderDate: Date when the order was placed.
  - OrderNumber: Unique order number.
  - CustomerId: Identifier linking to the Customer entity (Foreign Key).
  - TotalAmount: Total amount for the order.
##### OrderItem

###### Attributes:
  - Id: Unique identifier for the order item (Primary Key).
  - OrderId: Identifier linking to the Orders entity (Foreign Key).
  - ProductId: Identifier linking to the Product entity (Foreign Key).
  - UnitPrice: Price per unit of the product.
  - Quantity: Number of units ordered.
##### Product

###### Attributes:
  - Id: Unique identifier for the product (Primary Key).
  - ProductName: Name of the product.
  - SupplierId: Identifier linking to the Supplier entity (Foreign Key).
  - UnitPrice: Price per unit of the product.
  - Package: Packaging details.
  - IsDiscontinued: Status indicating if the product is discontinued.
##### Supplier

###### Attributes:
  - Id: Unique identifier for the supplier (Primary Key).
  - CompanyName: Name of the supplier company.
  - ContactName: Name of the primary contact person.
  - ContactTitle: Title of the contact person.
  - City: City where the supplier is located.
  - Country: Country where the supplier is located.
  - Phone: Contact phone number.
  - Fax: Fax number
