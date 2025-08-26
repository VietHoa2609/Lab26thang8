# Sử dụng image Tomcat chính thức
FROM tomcat:9.0-jdk11

# Xóa các app mặc định của Tomcat (ROOT, docs, examples…)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war của project vào thư mục webapps
COPY target/ch04_ex1_survey.war /usr/local/tomcat/webapps/ROOT.war

# Expose port Tomcat
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
