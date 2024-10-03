#Download base image ubuntu 17.04
FROM s390x/ubuntu:latest
 
# Update Software repository
RUN apt-get update

# Install requirements
RUN apt-get -y install \
	bbe \
	locales \
	subversion \
	gcc \
	dosfstools \
	make \
	man-db \
	help2man \
	valgrind \
	sudo \
	xz-utils \
	vim

# remove package lists
run  rm -rf /var/lib/apt/lists/*

# locale definition
run localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
run localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
run localedef -i en_US -f ISO-8859-1 -A /usr/share/locale/locale.alias en_US.ISO-8859-1

ENV LANG de_DE.utf8
ENV HOME /home/tester

# setup tester
RUN useradd -c 'Test user' -m -d /home/tester -s /bin/bash -p "" tester
RUN sudo adduser tester sudo

#RUN mkdir /home/tester/artifacts
#RUN chown -R tester:tester /home/tester/artifacts
USER tester

ADD do_tests.sh /home/tester/do_tests.sh

WORKDIR /home/tester

CMD /home/tester/do_tests.sh

 
