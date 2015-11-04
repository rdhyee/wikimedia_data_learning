set -e
docker build -t rdhyee/wikimedia_data_learning .
PORT=${1:-8888}

# turn off loading of pywikibot user config file

# local
#docker run -e "PYWIKIBOT2_NO_USER_CONFIG=1" -e USE_HTTPS=yes -d -p $PORT:8888 -e "PASSWORD=$IPN_PW_DEFAULT" \
#            -v `pwd`/notebooks:/home/jovyan/work  \
#            rdhyee/wikimedia_data_learning

# remote 
docker run -e "PYWIKIBOT2_NO_USER_CONFIG=1" -e USE_HTTPS=yes -d -p $PORT:8888 -e "PASSWORD=$IPN_PW_DEFAULT" \
            rdhyee/wikimedia_data_learning
