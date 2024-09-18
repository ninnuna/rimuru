import pyspark
import pyspark.sql as s
import pyspark.sql.functions as f
import pyspark.sql.types as t
from pyspark import SparkConf

ss = (s.SparkSession.builder
      .appName("SparkSession App")
      .config(conf=SparkConf().setAll([]))
# In python always go for by key argument passing to avoid any confusion. With set all send list of
# tuple (of properties)
      .master("local[*]")
# Master is local as it is local * for engaging the cores, you can specify the no. of cores too.
      .getOrCreate())
ss.sparkContext.setLogLevel("ERROR")

# Creating a rdd by parallelizing the collection.
rdd = ss.sparkContext.parallelize(range(10))
print(rdd.reduce(lambda x, y: x + y))
