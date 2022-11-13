# Kafka Populator

This is a supporting application to the [ODH Labs Customer Churn AI/ML Workshop](https://github.com/odh-labs/ml-workshop).

It uses a Kubernetes job that employs a Docker image that loops through a CSV file [like the one in the Churn repo](https://raw.githubusercontent.com/odh-labs/ml-workshop/main/data-files/products/Customer-Churn_P2.csv) and pushes a JSON representaion of each row to Kafka. That Kafka
- has a Cluster called *odh-message-bus2*
- and a Topic called *datatelco2*

