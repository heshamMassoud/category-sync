FROM ubuntu:12.04
MAINTAINER Hesham Massoud "hesham.massoud@commercetools.com"
COPY build/libs/category-sync.jar /home/category-sync.jar
CMD ["java","-jar","/home/category-sync.jar"]