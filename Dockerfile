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
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm 

#Install required php 5.6 packages
RUN yum install -y php56w php56w-fpm

#Update PHP configs
ADD ./php.ini /etc/php.ini
ADD ./www.conf /etc/php-fpm.d/www.conf

#Update nginx config
ADD ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443

#Run nginx engine
CMD ["/usr/sbin/nginx && /usr/sbin/php-fpm --nodaemonize"]
