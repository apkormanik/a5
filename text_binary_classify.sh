#!/bin/bash
export CLASSPATH=$CLASSPATH:~/a5/weka-3-8-5/weka.jar:~/a5/weka-3-8-5/libsvm.jar
java weka.core.converters.TextDirectoryLoader -dir text_example > text_example.arff
java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector  -i text_example.arff -o text_example_training.arff -M 2
java -Xmx1024m  weka.classifiers.meta.ClassificationViaRegression -W weka.classifiers.trees.M5P -num-decimal-places 4  -t  text_example_training.arff -d text_example_training.model -c 1
