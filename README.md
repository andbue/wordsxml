## WORDS
This build upon alpheios-project/wordsxml and adds some code to call WORDS directly from python.


## Building
```
apt-get install gprbuild gnat
cd wordsxml/src
./make_linux.sh
./make_python.sh
pip install lxml
./test.py
```

