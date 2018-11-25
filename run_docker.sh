set -e
docker build -t rdhyee/wikimedia_data_learning .
PORT=${1:-8888}

# turn off loading of pywikibot user config file

# local
#docker run -e "PYWIKIBOT2_NO_USER_CONFIG=1" -e USE_HTTPS=yes -d -p $PORT:8888 -e "PASSWORD=$IPN_PW_DEFAULT" \
#            -v `pwd`/notebooks:/home/jovyan/work  \
#            rdhyee/wikimedia_data_learning

# remote 
# docker run -e "PYWIKIBOT2_NO_USER_CONFIG=1" -e GEN_CERT=yes -d -p $PORT:8888 -e "PASSWORD=$IPN_PW_DEFAULT" \
#            rdhyee/wikimedia_data_learning

# docker run -d  -v `pwd`:/home/jovyan/work -p $PORT:8888 -e "PYWIKIBOT2_NO_USER_CONFIG=1" \
#    -e GEN_CERT=yes rdhyee/wikimedia_data_learning \
#    start-notebook.sh --NotebookApp.password='sha1:cfc5f75e0905:e91ef06bf1229ab9a0941b5c0d97bf2417f63902'

docker run -v `pwd`:/home/jovyan -p $PORT:8888 -e "PYWIKIBOT2_NO_USER_CONFIG=1" \
   -e GEN_CERT=yes rdhyee/wikimedia_data_learning \
   start-notebook.sh --NotebookApp.token='password123'

