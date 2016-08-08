FROM java:7

MAINTAINER Gokhan Sengun <gokhansengun@gmail.com>

ADD http://www-us.apache.org/dist/jmeter/binaries/apache-jmeter-3.0.zip /apache-jmeter-3.0.zip

RUN unzip /apache-jmeter-3.0.zip && rm /apache-jmeter-3.0.zip && mv /apache-jmeter-3.0 /jmeter && ln -s /jmeter/bin/jmeter /usr/local/bin/jmeter

# Copy MSSQL and PostgreSQL JDBC Drivers

ADD jdbc/postgresql-9.4.1209.jre7.jar /apache-jmeter-3.0/lib/
ADD jdbc/sqljdbc4.jar /apache-jmeter-3.0/lib/

# Test simply

RUN jmeter 2>&1 | grep "JMeter 3.0"

WORKDIR /jmeter

ENTRYPOINT [ "jmeter" ]

CMD [ "--help" ]