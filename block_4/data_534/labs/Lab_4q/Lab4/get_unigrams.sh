#!/usr/bin/env bash

for X in p q r s t u v x y z other pos punctuation
do
    wget http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-1gram-20120701-${X}.gz
    echo "Done with $X"
done