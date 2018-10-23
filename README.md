### EXAMPLES

```
source env.sh
bash build.sh
bash run_dev.sh $VERSION
```



##### STD INPUT MODE

```
cd marian-dev/build
./marian-decoder 
	--type nematus 
	--models /wmt17_systems/en-de/model.l2r.ens1.npz 
	--vocabs /wmt17_systems/en-de/vocab.en.json /wmt17_systems/en-de/vocab.de.json  
	--dim-vocabs 51100 74383   	
	--enc-depth 1     
	--enc-cell-depth 4     
	--enc-type bidirectional      
	--dec-depth 1   
	--dec-cell-base-depth 8  
	--dec-cell-high-depth 1   
	--dec-cell gru-nematus 
	--enc-cell gru-nematus   
	--tied-embeddings true
```


##### FILE INPUT OUTPUT MODE

```
cd marian-dev/build
./marian-decoder
        --type nematus
        --models /wmt17_systems/en-de/model.l2r.ens1.npz
        --vocabs /wmt17_systems/en-de/vocab.en.json /wmt17_systems/en-de/vocab.de.json  
        --dim-vocabs 51100 74383        
        --enc-depth 1     
        --enc-cell-depth 4     
        --enc-type bidirectional      
        --dec-depth 1   
        --dec-cell-base-depth 8  
        --dec-cell-high-depth 1   
        --dec-cell gru-nematus 
        --enc-cell gru-nematus   
        --tied-embeddings true      < input.txt  > output.txt
```
