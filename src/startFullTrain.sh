#!/bin/sh

mkdir -p data
wget http://www.statmt.org/europarl/v7/ro-en.tgz -O data/ro-en.tgz
wget http://opus.lingfil.uu.se/download.php?f=SETIMES2/en-ro.txt.zip -O data/SETIMES2.ro-en.txt.zip
wget http://data.statmt.org/rsennrich/wmt16_backtranslations/ro-en/corpus.bt.ro-en.en.gz -O data/corpus.bt.ro-en.en.gz
wget http://data.statmt.org/rsennrich/wmt16_backtranslations/ro-en/corpus.bt.ro-en.ro.gz -O data/corpus.bt.ro-en.ro.gz









./marian-dev/build/marian   -t data/corpus.clean.bpe.ro data/corpus.clean.bpe.en   --model model/model.npz   --disp-freq 100

