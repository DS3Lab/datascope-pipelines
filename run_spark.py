from dspipes import MllibPipelines
from pyspark import SparkContext
from pyspark.sql import SparkSession
import time
import argparse

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description="Run the RumbleML experiments.")

    DATASETS = ["Criteo", "YFCC"]
    parser.add_argument("-d", "--dataset", type=str, default="Criteo", choices=DATASETS,
        help="Datasets to use. Default: Criteo")

    MODELS = ['logistic', 'RandomForest', 'LinearSVC', 'NB']
    parser.add_argument("-m", "--model", type=str, default='logistic', choices=MODELS,
        help="Model to run. Default: logistic")
    ALL_PIPELINES = [0, 1, 3, 5]
    parser.add_argument("-p", "--pipeline", type=int, default=0, choices=ALL_PIPELINES,
        help="Pipelines to run. Default: 0")

    args = parser.parse_args()
    pipeline = args.pipeline
    dataset = args.dataset
    model = args.model

    #start = time.perf_counter()

    sc = SparkContext("local", "SparkML script")
    spark = SparkSession(sc)

    pipeline = MllibPipelines.create_numerical_pipeline(f'pipe_{pipeline}', imputer=False, clf_mode=f'{model}')

    if dataset == 'Criteo':
        training_path = "/Users/david/Projects/rumble_testbed/criteo.kaggle2014.test.parquet"
        test_path = "/Users/david/Projects/rumble_testbed/criteo.kaggle2014.test.parquet"
    else:
        assert(dataset == 'YFCC')
        training_path = "/Users/david/Projects/rumble_testbed/criteo.kaggle2014.test.parquet"
        test_path = "/Users/david/Projects/rumble_testbed/criteo.kaggle2014.test.parquet"

    training = spark.read.load(training_path)
    test = spark.read.load(test_path)

    model = pipeline.fit(training)
    prediction = model.transform(test)
    predictionAndLabels = prediction.select("label", "prediction") 
    correctY = predictionAndLabels.filter("label == prediction").count()
    total = predictionAndLabels.count()
    #end = time.perf_counter()
    print(f'Acc: {correctY / total}')
    #print(f'Time: {end - start}')