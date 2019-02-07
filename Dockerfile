FROM centos:7

RUN yum -y update && yum clean all
RUN yum -y install telnet

CMD ["/usr/sbin/init"]