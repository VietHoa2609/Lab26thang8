FROM openjdk:24-jdk-slim AS base

# Cài wget + tar
RUN apt-get update && apt-get install -y wget tar && rm -rf /var/lib/apt/lists/*

# Cài Tomcat 10.0.27
RUN wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz \
    && tar xzf apache-tomcat-10.0.27.tar.gz \
    && mv apache-tomcat-10.0.27 /usr/local/tomcat \
    && rm apache-tomcat-10.0.27.tar.gz

# Thiết lập biến môi trường
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH="$CATALINA_HOME/bin:$PATH"

# Xóa app mặc định rồi copy war của em vào
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ch04_ex1_survey.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
