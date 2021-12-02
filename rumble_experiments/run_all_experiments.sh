echo 'Experiment 0 logistic Criteo'
time spark-submit --name 'Experiment 0 logistic Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_0_logistic_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 0 logistic Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 0 -d Criteo
echo 'Experiment 0 RandomForest Criteo'
time spark-submit --name 'Experiment 0 RandomForest Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_0_RandomForest_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 0 RandomForest Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 0 -d Criteo
echo 'Experiment 0 LinearSVC Criteo'
time spark-submit --name 'Experiment 0 LinearSVC Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_0_LinearSVC_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 0 LinearSVC Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 0 -d Criteo
echo 'Experiment 0 NB Criteo'
time spark-submit --name 'Experiment 0 NB Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_0_NB_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 0 NB Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 0 -d Criteo
echo 'Experiment 1 logistic Criteo'
time spark-submit --name 'Experiment 1 logistic Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_1_logistic_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 1 logistic Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 1 -d Criteo
echo 'Experiment 1 RandomForest Criteo'
time spark-submit --name 'Experiment 1 RandomForest Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_1_RandomForest_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 1 RandomForest Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 1 -d Criteo
echo 'Experiment 1 LinearSVC Criteo'
time spark-submit --name 'Experiment 1 LinearSVC Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_1_LinearSVC_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 1 LinearSVC Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 1 -d Criteo
echo 'Experiment 1 NB Criteo'
time spark-submit --name 'Experiment 1 NB Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_1_NB_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 1 NB Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 1 -d Criteo
echo 'Experiment 3 logistic Criteo'
time spark-submit --name 'Experiment 3 logistic Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_3_logistic_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 3 logistic Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 3 -d Criteo
echo 'Experiment 3 RandomForest Criteo'
time spark-submit --name 'Experiment 3 RandomForest Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_3_RandomForest_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 3 RandomForest Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 3 -d Criteo
echo 'Experiment 3 LinearSVC Criteo'
time spark-submit --name 'Experiment 3 LinearSVC Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_3_LinearSVC_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 3 LinearSVC Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 3 -d Criteo
echo 'Experiment 3 NB Criteo'
time spark-submit --name 'Experiment 3 NB Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_3_NB_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 3 NB Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 3 -d Criteo
echo 'Experiment 5 logistic Criteo'
time spark-submit --name 'Experiment 5 logistic Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_5_logistic_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 5 logistic Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 5 -d Criteo
echo 'Experiment 5 RandomForest Criteo'
time spark-submit --name 'Experiment 5 RandomForest Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_5_RandomForest_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 5 RandomForest Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 5 -d Criteo
echo 'Experiment 5 LinearSVC Criteo'
time spark-submit --name 'Experiment 5 LinearSVC Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_5_LinearSVC_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 5 LinearSVC Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 5 -d Criteo
echo 'Experiment 5 NB Criteo'
time spark-submit --name 'Experiment 5 NB Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_5_NB_Criteo.rumble'
time spark-submit spark-submit --name 'Experiment 5 NB Criteo' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 5 -d Criteo
echo 'Experiment 0 logistic YFCC'
time spark-submit --name 'Experiment 0 logistic YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_0_logistic_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 0 logistic YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 0 -d YFCC
echo 'Experiment 0 RandomForest YFCC'
time spark-submit --name 'Experiment 0 RandomForest YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_0_RandomForest_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 0 RandomForest YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 0 -d YFCC
echo 'Experiment 0 LinearSVC YFCC'
time spark-submit --name 'Experiment 0 LinearSVC YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_0_LinearSVC_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 0 LinearSVC YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 0 -d YFCC
echo 'Experiment 0 NB YFCC'
time spark-submit --name 'Experiment 0 NB YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_0_NB_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 0 NB YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 0 -d YFCC
echo 'Experiment 1 logistic YFCC'
time spark-submit --name 'Experiment 1 logistic YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_1_logistic_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 1 logistic YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 1 -d YFCC
echo 'Experiment 1 RandomForest YFCC'
time spark-submit --name 'Experiment 1 RandomForest YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_1_RandomForest_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 1 RandomForest YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 1 -d YFCC
echo 'Experiment 1 LinearSVC YFCC'
time spark-submit --name 'Experiment 1 LinearSVC YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_1_LinearSVC_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 1 LinearSVC YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 1 -d YFCC
echo 'Experiment 1 NB YFCC'
time spark-submit --name 'Experiment 1 NB YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_1_NB_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 1 NB YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 1 -d YFCC
echo 'Experiment 3 logistic YFCC'
time spark-submit --name 'Experiment 3 logistic YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_3_logistic_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 3 logistic YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 3 -d YFCC
echo 'Experiment 3 RandomForest YFCC'
time spark-submit --name 'Experiment 3 RandomForest YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_3_RandomForest_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 3 RandomForest YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 3 -d YFCC
echo 'Experiment 3 LinearSVC YFCC'
time spark-submit --name 'Experiment 3 LinearSVC YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_3_LinearSVC_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 3 LinearSVC YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 3 -d YFCC
echo 'Experiment 3 NB YFCC'
time spark-submit --name 'Experiment 3 NB YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_3_NB_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 3 NB YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 3 -d YFCC
echo 'Experiment 5 logistic YFCC'
time spark-submit --name 'Experiment 5 logistic YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_5_logistic_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 5 logistic YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m logistic -p 5 -d YFCC
echo 'Experiment 5 RandomForest YFCC'
time spark-submit --name 'Experiment 5 RandomForest YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_5_RandomForest_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 5 RandomForest YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m RandomForest -p 5 -d YFCC
echo 'Experiment 5 LinearSVC YFCC'
time spark-submit --name 'Experiment 5 LinearSVC YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_5_LinearSVC_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 5 LinearSVC YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m LinearSVC -p 5 -d YFCC
echo 'Experiment 5 NB YFCC'
time spark-submit --name 'Experiment 5 NB YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g s3://rumbleml-data/rumble_experiments/rumbledb-1.16.0.jar --query-path 's3://rumbleml-data/rumble_experiments/query_5_NB_YFCC.rumble'
time spark-submit spark-submit --name 'Experiment 5 NB YFCC' --conf spark.dynamicAllocation.enabled=false --num-executors 4 --executor-cores 2 --executor-memory 19g run_spark.py -m NB -p 5 -d YFCC
