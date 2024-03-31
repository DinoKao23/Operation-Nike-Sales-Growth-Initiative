# Determine Business Objective
### Background
A significant challenge for Nike could be optimizing sales performance. This problem involves identifying patterns and trends within sales data to uncover insights that can drive strategic decisions to boost sales efficiency and effectiveness. By focusing on sales data, we aim to pinpoint opportunities for increasing revenue, improving product positioning, and tailoring marketing strategies to match consumer preferences more closely.
### Business Activity Category
Increased Revenue: A36-Marketing Performace management
### OKR (Objectives and Key Results)
Objective: Increase Nike’s Sales
Key Result: 
- Increase Nike’s total sales by 5% in 3 months. 
- Find 2 potential products to be the best sellers in a month.  
### OKR Initiatives
- Finalized datasets with combined fields.
- Finding the characteristics of Nike’s products.
- Create a descriptive dashboard.
- Building a predictive model to forecast product sales.

# Assess Situation
### Inventory of Resources
Personnel: 
- Tsai Lieh Kao (Data Scientist)
- Xi Chen (Data Analyst)
- Edward Pate (Data Visualization Analyst)
- Vishwam Ramesh (Data Engineer)
Data: Nike Sportswear Product, Nike transaction data, Generated customer data.
Computing Resources: personal computers, internet access, SQL database server.
Software: Excel, MySQLWorkbech, Python Jupyter Notebook, Google Colab.
### Assumptions and Constraints
Assumptions: 
- Find factors (fields) from our data that impact sales.
- Find the pattern of best-selling products.
- Find the loyal customers.
- Executing marketing strategies on popular products for sales improvement.
Constraints:
- Generated data records and fields may lead to incorrect patterns compared to the real market.
- Time Constraints: The project timeline is tight, with only a few months to achieve significant sales increases. This limits the depth of data analysis and model refinement.
- Data Quality & Availability: Given that Nike does not publicly release detailed sales and marketing data, and the absence of an API to access such information directly, selecting appropriate datasets for this project poses a challenge.
### Risks and Contingencies
Risks:
- Data Representativeness and Bias: Relying on publicly available datasets might introduce bias, as such data may not fully capture Nike's diverse customer base or accurately represent sales trends. This can lead to skewed insights and recommendations.
- Model Overfitting: With limited and potentially non-representative datasets, there's a heightened risk of developing predictive models that overfit the data. This could result in poor performance when applied to real-world scenarios or future Nike sales data.
Contingencies:
- Data Source Diversification: To mitigate the risk of data bias, the project will seek to diversify its data sources, incorporating a variety of public datasets that offer different perspectives on consumer behavior and market trends relevant to Nike.
- Model Validation Strategies: To counteract the risk of model overfitting, the project will employ rigorous model validation techniques. This includes using cross-validation and splitting the data into training and testing sets to ensure models are generalizable and robust against unseen data.

Terminology
- Market Trends: The general direction in which a market or industry is moving, influenced by economic, technological, and societal factors.
- Customer Behavior Trends: Patterns that indicate how consumers select, purchase, use, and dispose of products and services over time.
- CLV (Customer Lifetime Value): A prediction of the total value a business will derive from their entire relationship with a customer.
- Predictive Modeling: A statistical technique using historical data to predict future outcomes.
- Analytics Dashboard: A visual representation tool that displays data, metrics, and key performance indicators (KPIs) to monitor and analyze business processes.
### Costs and Benefits
- Costs are based on a typical hourly rate for each role identified under personnel and the expected hours required to complete the project
Costs:
- The average hourly rate for an Analyst according to ZipRecruiter is $40.
Personal Costs: 4 (people) x 40 (hrs) x 40 ($) = $6400
Other possible costs: Cloud computing / AWS services (if using), other software charges.
- Benefits based on the Data Periodic Table's Business Activity Categories. Try to quantify as best as you can, i.e. for labor hours saved. If you cannot quantify the benefit, still identify the benefit.
Benefits:
- Increased Revenue: Predictive modeling to pinpoint best-sellers for inventory optimization and leveraging customer behavior insights can enhance product marketing and sales strategies, leading to revenue growth.
- Decreased Costs: Optimizing marketing efforts and enhancing operational efficiencies in product distribution and sales can lead to significant cost reductions over time.
- Risk Mitigation: Using predictive models for demand forecasting reduces the risk of stockouts or overstock, saving costs and improving market entry strategies. Understanding market trends and customer behavior helps mitigate risks associated with new product launches.
- Strategic Insights: Data analysis informs strategic decisions, directing focus toward profitable markets, products, or customer segments with untapped potential.
- Compliance: Adhering to data privacy and ethical data use standards supports compliance and safeguards against reputational risks, indirectly benefiting the project.

# Determine Data Mining Goals
### Data Mining Goals aka Enabling Activities aka Data Activities.
Identify ALL relevant data activities from the Data Periodic Table
- F01: Increased use of external data
- F04: Incentives for customers to provide more data
- F05: More consistent data capture
- F06: Improved quality of customer data
- F07: Increased use of structured data
- F08: Increased use of unstructured data
- F09: Improved data methods and processes
- F11: Increased understanding and insight of customers
- F13: Single customer view
- F15: Improved modeling accuracy
- F16: Reduced modeling development and production time
- F17: Improved use of data science models
- F19. Improved analytics tools
- F22. More accessible data
- F23. Improved use of machine learning
- F24. Reduced time taken to access data
- F25. Improved transactional data
- F26. Improved event detection analysis for rules-based decisioning
- F27. Improved real-time decisioning
- F28. Improved data team skills
- F29. Stronger analytics community
- F30. More knowledgeable data community
### Data Mining Success Criteria
- Enhanced Data Collection and Quality: Improvement in the collection methods leading to higher quality and accuracy of customer data.
- Effective Use of Both Structured and Unstructured Data: Leveraging a mix of structured and unstructured data to gain comprehensive insights into consumer behaviors and preferences.
- Increased Understanding of Customers: Gaining deep insights into customer needs, behaviors, and preferences to inform marketing and product strategies.
- Improved Modeling Accuracy: Enhanced accuracy in predictive models to forecast consumer trends and product performance accurately.
- Reduced Modeling Development Time: Efficiency in developing and deploying models, reducing the time from concept to actionable insights.
- Accessibility and Speed of Data Analysis: Ensuring key data is easily accessible and can be quickly analyzed to support agile decision-making.
- Improved Use of Machine Learning: Effective application of machine learning techniques to uncover patterns and predict future market trends and consumer behaviors.

	
# Produce Project Plan
- Initial Assessment of Tools (Technology) and Techniques (Analytics)
### Tools (Technology)
- SQL Databases: For structured data storage, enabling efficient data retrieval and management.
- Python: for data manipulation, analysis, and machine learning with libraries such as pandas, NumPy, and scikit-learn.
- Data Visualization Tools: Tableau for creating interactive dashboards to present insights.
- Machine Learning Platforms: TensorFlow or PyTorch for developing predictive models to forecast market trends and consumer behavior.
### Techniques (Analytics)
- Descriptive Analytics: Summarize historical data to identify sales trends and patterns in customer behavior.
- Predictive Analytics: Use statistical models and machine learning to forecast future trends based on historical data.
- Data Mining: Employ clustering for customer segmentation and association analysis to uncover purchase patterns.

### Data Toolkit Items
- Dashboards, Reports, Data Feeds, Data Science & ML.

### Project Plan
- Sprint 0: Business Problem Definition, Setting up a collaborative environment (shared folders, notebooks, files, repo, etc.), Finding the datasets.
- Sprint 1: Descriptive Analytics Dashboard, ETL pipeline, ERD, Data Dictionary, SQL warehouse, Data Governance, Data Lineage.
- Sprint 2: Automate ETL pipeline, Diagnostic Analytics Dashboard, Predictive Model, A/B Test, Data Manifesto, 
