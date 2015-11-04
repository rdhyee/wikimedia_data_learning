FROM andrewosh/binder-base

# for use with mybinder.org

MAINTAINER Raymond Yee  <raymond.yee@gmail.com>

USER root
RUN apt-get -y install python-lxml libxml2-dev libxslt1-dev
        
USER main

RUN pip install lxml 
RUN pip install mwclient
RUN pip install git+git://github.com/mwclient/mwclient@v0.7.1
RUN pip install https://bitbucket.org/rdhyee/mwclient/get/wpp.tar.bz2
RUN pip install git+git://github.com/rdhyee/mwclient@wpp_integrate

RUN pip install responses && \
    pip install pytest && \
    pip install boltons && \
    pip install pywikibot && \
    pip install cssselect

