FROM ubuntu:12.04
MAINTAINER Hesham Massoud "hesham.massoud@commercetools.com"
COPY category-sync.jar /home/category-sync.jar
CMD ["java","-jar","/home/category-sync.jar"]