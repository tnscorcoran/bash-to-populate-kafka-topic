FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y default-jre
COPY kafka_2.13-3.0.0.tgz /opt
COPY Customer-Churn_P2-LARGE.csv /opt
COPY Customer-Churn_P2-SMALL.csv /opt
COPY read-churn-prod-csv.sh /opt
RUN chmod 750 /opt/read-churn-prod-csv.sh
WORKDIR /opt
RUN tar -xzvf /opt/kafka_2.13-3.0.0.tgz
RUN ls /opt

CMD /opt/read-churn-prod-csv.sh odh-message-bus2-kafka-bootstrap:9092 datatelco2

