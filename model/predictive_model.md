# Model Description
The model tries to predict the customers' revenue when they purchase on the Nike website. With Linear Regression, we consider multiple factors and how they influence the quantity they purchase and predict the total revenue.

# Feature List
DEPARTMENT: Three types of target audience  - Kids, Men, Women
SUBCATEGORY: The item types they will purchase - ex. Hats, Jackets, All Shoes
IS_BESTSELLER: Is this item recommended as a bestseller or not? - True or False
COLOR: The color of the products - Ex. Black/White, Cool Grey
State: The state where the customers live in - AZ, CA, TX
Age: Customers Age
Month: The month when the customers made the transaction
Day: The day when the customers made the transaction

* PRICE_RETAIL: The item price of the product
This factor has some issues cause this variable is highly correlated with the revenue. However, remove this variable highly decreased the model's performance, which will be address in the later section.

# Model Output


