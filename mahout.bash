//Get movies data
wget http://files.grouplens.org/datasets/movielens/ml-1m.zip
unzip ml-1m.zip

//Convert ratings.dat, trade “::” for “,”, and take only the first three columns:
cat ml-1m/ratings.dat | sed 's/::/,/g' | cut -f1-3 -d, > ratings.csv

//Put ratings file into HDFS:
hadoop fs -put ratings.csv /ratings.csv

//Run recommendation job
mahout recommenditembased --input /ratings.csv --output recommendations --numRecommendations 10 --outputPathForSimilarityMatrix similarity-matrix --similarityClassname SIMILARITY_COSINE


//Look for the results in the part-files containing the recommendations:
hadoop fs -ls recommendations
hadoop fs -cat recommendations/part-r-00000 | head





//Get Twisted, and Klein and Redis modules for Python.
sudo easy_install twisted
sudo easy_install klein
sudo easy_install redis


//Install and start redis server
wget http://download.redis.io/releases/redis-2.8.7.tar.gz
tar xzf redis-2.8.7.tar.gz
cd redis-2.8.7
make
./src/redis-server &



//Put content into “hello.py”


//Start web service
twistd -noy hello.py &


//Test the web service with user id “37”:
curl localhost:8080/37

