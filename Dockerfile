#Author:PG - Demo/Training/Testing

FROM centos:centos7

RUN yum -y update; yum clean all
RUN yum -y install sudo epel-release; yum clean all

#Sudo requires a tty. fix that.
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

#Install nginx repo
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

# Install latest version of nginx
RUN yum install -y nginx 

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#Install remi repo manager to deploy php 5.6
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

#Install required php 5.6 packages
RUN yum install -y php56 php56-php-fpm --enablerepo=remi,remi-php56

EXPOSE 80
EXPOSE 443

#Run nginx engine
CMD ["nginx"]
