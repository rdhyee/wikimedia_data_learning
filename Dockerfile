FROM jupyter/scipy-notebook

MAINTAINER Raymond Yee  <raymond.yee@gmail.com>

#USER root
#RUN apt-get -y install python-lxml libxml2-dev libxslt1-dev
        
USER jovyan

RUN conda install -n python2 lxml
RUN pip2 install mwclient
RUN pip2 install git+git://github.com/mwclient/mwclient@v0.7.1
RUN pip2 install https://bitbucket.org/rdhyee/mwclient/get/wpp.tar.bz2
RUN pip2 install git+git://github.com/rdhyee/mwclient@wpp_integrate

RUN pip2 install responses && \
    pip2 install pytest && \
    pip2 install boltons && \
    pip2 install pywikibot && \
    pip2 install cssselect

COPY notebooks/ /home/jovyan/work
# A bit ugly but unfortunately necessary: https://github.com/docker/docker/issues/6119
USER root
RUN chown -R jovyan:users /home/jovyan/work

#USER jovyan

VOLUME ["/user/jovan/work", "/data"]

