FROM jupyter/scipy-notebook

MAINTAINER Raymond Yee  <raymond.yee@gmail.com>

USER root
RUN apt-get -y install python-lxml libxml2-dev libxslt1-dev
        
        
USER jovyan

RUN /opt/conda/envs/python2/bin/pip install lxml
RUN /opt/conda/envs/python2/bin/pip install mwclient
RUN /opt/conda/envs/python2/bin/pip install git+git://github.com/mwclient/mwclient@v0.7.1
RUN /opt/conda/envs/python2/bin/pip install https://bitbucket.org/rdhyee/mwclient/get/wpp.tar.bz2
RUN /opt/conda/envs/python2/bin/pip install git+git://github.com/rdhyee/mwclient@wpp_integrate

RUN /opt/conda/envs/python2/bin/pip install responses && \
    /opt/conda/envs/python2/bin/pip install pytest && \
    /opt/conda/envs/python2/bin/pip install boltons && \
    /opt/conda/envs/python2/bin/pip install pywikibot && \
    /opt/conda/envs/python2/bin/pip install cssselect

COPY notebooks/ /home/jovyan/work
# A bit ugly but unfortunately necessary: https://github.com/docker/docker/issues/6119
USER root
RUN chown -R jovyan:users /home/jovyan/work

#USER jovyan

VOLUME ["/user/jovan/work", "/data"]

