#!/bin/bash


brokers=$1
topic=$2
counter=0

echo "brokers:"$brokers
echo "topic:"$topic

exec < Customer-Churn_P2-LARGE.csv || exit 1
read header # read (and ignore) the first line
while IFS=, read customerID PhoneService MultipleLines InternetService OnlineSecurity OnlineBackup DeviceProtection TechSupport StreamingTV StreamingMovies Contract PaperlessBilling PaymentMethod MonthlyCharges TotalCharges Churn; do

    let counter++

    echo "Loop counter: "$counter
    jason='{"customerID": '$customerID', "PhoneService": "'$PhoneService'", "MultipleLines": "'$MultipleLines'", "InternetService": "'$InternetService'", "OnlineSecurity": "'$OnlineSecurity'", "OnlineBackup": "'$OnlineBackup'", "DeviceProtection": "'$DeviceProtection'", "TechSupport": "'$TechSupport'", "StreamingTV": "'$StreamingTV'", "StreamingMovies": "'$StreamingMovies'", "Contract": "'$Contract'", "PaperlessBilling": "'$PaperlessBilling'", "PaymentMethod": "'$PaymentMethod'", "MonthlyCharges": '$MonthlyCharges', "TotalCharges": '$TotalCharges', "Churn": "'$Churn'"}'
    
    echo $jason

    echo "==============================================================================================================="

    # ls -l /opt/kafka_2.13-3.0.0/bin/
    
    
    # the & in the following call causes asynchronous execution - and an out of memory error:
    # echo $jason | /opt/kafka_2.13-3.0.0/bin/kafka-console-producer.sh --bootstrap-server $brokers --topic $topic &

    # therefore use synchronous execution - this takes hours.
    echo $jason | /opt/kafka_2.13-3.0.0/bin/kafka-console-producer.sh --bootstrap-server $brokers --topic $topic

    
done