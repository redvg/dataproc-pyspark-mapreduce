#!/usr/bin/env python

from pyspark import SparkContext
sc = SparkContext("local")

print 'hello from pyspark---'

# TODO: feed bucket folder from args or env
file = sc.textFile("gs://udemy-data-engineer-210920/dataproc1/input.txt")
dataLines = file.map(lambda s: s.split(",")).map(lambda x : (x[0], [x[1]]))
print dataLines.take(100)

databyKey = dataLines.reduceByKey(lambda a, b: a + b)
print databyKey.take(100)

countByKey = databyKey.map(lambda (k,v): (k, len(v)))
print countByKey.take(100)

print '---terminated successfully'
