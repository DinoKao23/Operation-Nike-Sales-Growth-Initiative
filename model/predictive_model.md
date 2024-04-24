# Model Description
The model tries to predict the customers' revenue when they purchase on the Nike website. With Linear Regression, we consider multiple factors and how these variables influence the quantity they buy and predict the total revenue. We are trying to predict the output of each individual purchase.


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
This factor has some issues because this variable is highly correlated with revenue. However, removing this variable greatly decreased the model's performance, which will be addressed later.

# Model Output
To address the PRICE_RETAIL issues, I created two models to see the performance differences between these two models.
The first one is has_price.pkl, which includes PRICE_RETAIL as a variable in our model training.
The second one is no_price.pkl, which PRICE_RETAIL is excluded in our model training.

When we try to predict each user's input, we can try to see which factor might have a high impact on the total purchase. Does the seasonality play a role in our revenue? Maybe certain types of products can have better revenue compared with other types. 

# Model Evaluation
There are two metrics we use to measure a Linear Regression model.
1. MSE (Mean Square Error): In this context, the MSE is each transaction's difference between the original price and the total price. If the MSE is high, we can tell this model has worse performance and a higher variety(different outcome) in the model.
2. R² (R-Squared): We want to ensure these variables relate to the predictive output. While the R²'s range is from 0 to 1, the high score varies across industries. If the R2 is high (close to 0.5), we can say these variables highly influence our revenue. If R² is low, we can interpret these variables as unrelated to the result.

has_price.pkl
MSE: 101271.46

R²: 0.57

We can see the MSE error is high when predicting the model. This means that the model isn't doing great when predicting the price. There might be product price range issues, and they aren't a great fit to use ML to predict. The model also has a great explanation when including revenue. In other words, including the product price in the revenue helps to explain why we get higher revenue with higher prices(which is obvious).

no_price.pkl
MSE: 228722.63

R²: 0.03

The model without PRICE_RETAIL has the worst performance compared to the one with PRICE_RETAIL. While the MSE is two times higher, its R² is only 0.03. In other words, it has a wider range when predicting a model and can't explain which variable influence the final price.

# How to use
After merging the necessary information, you can go to the inference part in the `predictive&inference.ipynb`. Change the file name `new_df.csv` to your csv file PATH and you can test the data by running the rest of the code. You also need to install the require package.
To install the packages, type
```
pip install package
```






