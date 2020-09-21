#!/bin/bash
# runAll.sh

echo -e '\nRunning Python Code'
cd python
python main.py $@
cd ..

echo -e '\nRunning Perl Code'
cd perl
perl main.pl $@
cd ..

echo -e '\nRunning JavaScript Code'
cd javascript
node main.js $@
cd ..

cd cpp
if [ ! -f "./bin/main" ];then
  echo -e '\nmain does not exist, compiling first.'
  make
fi
echo -e '\nRunning C++ Code'
./bin/main $@
cd ..
