#!/bin/bash

function help () {
  echo -e "Help Menu\n"
  echo "Usage:"
  echo "  bash newProject.sh [options] <project_name>"
  echo ""
  echo "Options:"
  echo "  -h,  --help        Prints this message and exits"
  echo "  -e,  --examples    Prints help menu and examples"
  echo "  -a,  --args        Declares cli args to pass to the scripts when run"
  echo "  -d,  --desc        Declares project description (Added to project's README.md)"
  echo ""
  echo "Note: It's recommended to put args and description in quotes"
  echo ""
}

function examples () {
  echo "Examples:"
  echo "  bash newProject.sh test"
  echo "    --> Creates project test"
  echo "  bash newProject.sh test -a \"<arg1> <arg2>\""
  echo "    --> Creates project test with readme args <arg1> <arg2>"
  echo "  bash newProject.sh test -d \"Test repo\" -a \"<arg1>\""
  echo "    --> Creates project with readme description \"Test Repo\" and args <arg1>"
  echo "  bash newProject.sh test -d \"Test repo\""
  echo "    --> Creates project with readme description \"Test Repo\""
  echo "  bash newProject.sh"
  echo "    --> Displays error message and exits"
  echo ""
}

function makeReadme () {
  echo "# ${PROJECT_NAME}

${DESCRIPTION}

## How to Run

You can run every program using the \`runAll.sh\` script or go into each individual language directory and manually run each script.

#### Examples:
\`\`\`
# Option 1:
  # Run all at once

  bash runAll.sh $ARGS

# Option 2:
  # Run Individualy

  cd python
  python main.py $ARGS
  cd ..

  cd perl
  perl main.pl $ARGS
  cd ..

  cd javascript
  node main.js $ARGS
  cd ..

  cd cpp
  ./bin/main $ARGS
  cd ..
\`\`\`
" >> README.md
}

function newPython () {
  mkdir python/

  echo "#!/usr/bin/env python3
# ${PROJECT_NAME}.py
" >> python/${PROJECT_NAME}.py

  echo "#!/usr/bin/env python3
# main.py
" >> python/main.py
}

function newPerl () {
  mkdir perl
  echo "#!/usr/bin/perl
# ${PROJECT_NAME}.pm
use strict;
use warnings;" >> perl/${PROJECT_NAME}.pm

  echo "#!/usr/bin/perl
# main.pl
use strict;
use warnings;" >> perl/main.pl
}

function newBashWrapper () {
  echo "#!/bin/bash
# runAll.sh

echo -e '\nRunning Python Code'
cd python
python main.py \$@
cd ..

echo -e '\nRunning Perl Code'
cd perl
perl main.pl \$@
cd ..

echo -e '\nRunning JavaScript Code'
cd javascript
node main.js \$@
cd ..

cd cpp
if [ ! -f \"./bin/main\" ];then
  echo -e '\nmain does not exist, compiling first.'
  make
fi
echo -e '\nRunning C++ Code'
./bin/main \$@
cd ..

" >> runAll.sh
}

function newCS () {
  dotnet new console -o $PROJECT_NAME
  mv $PROJECT_NAME "c#/"
}

function newCPP () {
  mkdir cpp
  mkdir cpp/bin/
  mkdir cpp/src/
  mkdir cpp/include/
  mkdir cpp/lib/
  echo "// main.cpp
#include <iostream>
using namespace std;

int main(int argc, char *argv[]) {
  if (argc < 3) {
		cout << \"InvalidEntry: Not enough arguments provided\" << endl;
		return 1;
	}

	return 0;
}" >> cpp/src/main.cpp

  echo "// ${PROJECT_NAME}.cpp
#include <iostream>
using namespace std;
" >> cpp/src/${PROJECT_NAME}.cpp

  echo "// ${PROJECT_NAME}.h
#include <iostream>
using namespace std;
" >> cpp/include/${PROJECT_NAME}.h

  echo -e "CXX := g++
CXX_FLAGS := -Wall -Wextra -std=c++17 -ggdb

BIN := bin
SRC := src
INCLUDE := include
LIB := lib
LIBRARIES :=
EXECUTABLE := main


all: \$(BIN)/\$(EXECUTABLE)

run: clean all
\tclear
\t@echo \"Executing...\"
\t./\$(BIN)/\$(EXECUTABLE)

\$(BIN)/\$(EXECUTABLE): \$(SRC)/*.cpp
\t@echo \"Building...\"
\t\$(CXX) \$(CXX_FLAGS) -I\$(INCLUDE) -L\$(LIB) \$^ -o \$@ \$(LIBRARIES)

clean:
\t@echo \"Clearing...\"
\t-rm \$(BIN)/*" >> cpp/makefile

}

function newJS () {
  mkdir javascript
  echo "// ${PROJECT_NAME}.js" >> javascript/${PROJECT_NAME}.js
}

ARGS=""
DESCRIPTION=""
PROJECT_NAME="${@: -1}"

while [[ "$#" -gt 0 ]]; do
    case $1 in
				-h | --help) # Prints this message and exits
					help
					exit 1
          ;;
        -e | --examples) # Prints help menu and examples
					help
          examples
					exit 1
          ;;
        -a | --args) # Declares cli args to pass to the scripts when run
          shift
          ARGS=$1
          ;;
        -d | --desc) # Declares project description (Added to project's README.md)
          shift
          DESCRIPTION="${1}"
          ;;
				*)
          true
					;;
    esac
    shift
done

echo "PROJECT NAME: ${PROJECT_NAME}"
echo "DESCRIPTION:  ${DESCRIPTION}"
echo "ARGS:         ${ARGS}"
exit 1

if [ "${PROJECT_NAME}" == "" ]; then
  echo "No program name provided"
  exit 1
fi

if [ "${ARGS}" == "" ]; then
  ARGS="<args>"
fi

mkdir $PROJECT_NAME
cd $PROJECT_NAME
newBashWrapper
makeReadme
newPython
newCPP
newJS
newPerl
# newCS
# newJava
