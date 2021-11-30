time spark-submit run_spark.py -m logistic -p 0 -d YFCC
time spark-submit run_spark.py -m RandomForest -p 0 -d YFCC
time spark-submit run_spark.py -m LinearSVC -p 0 -d YFCC
# time spark-submit run_spark.py -m NB -p 0 -d YFCC # NB does not work because of negative values in YFCC
time spark-submit run_spark.py -m logistic -p 1 -d YFCC
time spark-submit run_spark.py -m RandomForest -p 1 -d YFCC
time spark-submit run_spark.py -m LinearSVC -p 1 -d YFCC
# time spark-submit run_spark.py -m NB -p 1 -d YFCC
time spark-submit run_spark.py -m logistic -p 3 -d YFCC
time spark-submit run_spark.py -m RandomForest -p 3 -d YFCC
time spark-submit run_spark.py -m LinearSVC -p 3 -d YFCC
# time spark-submit run_spark.py -m NB -p 3 -d YFCC
time spark-submit run_spark.py -m logistic -p 5 -d YFCC
time spark-submit run_spark.py -m RandomForest -p 5 -d YFCC
time spark-submit run_spark.py -m LinearSVC -p 5 -d YFCC
# time spark-submit run_spark.py -m NB -p 5 -d YFCC

