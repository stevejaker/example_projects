# Purpose

I created this repository to showcase simple programs written in a variety of programming languages. I'm using this as a playground for learning and comparing different languages and attempting to write more sophisticated and complex code.

Regardless of language, each program is designed to be run from the command line and should have identical output. Additionally, where possible, I'm attempting to avoid using builtin or third-party libraries

## Languages

**Currently Included:** `Python, C++, JavaScript, Perl, Bash (see below)`

**Planned:** `C#, Java`

## Programs/Program Ideas
| Name | Status | Description | Required Args* |
| ---- | ---- | ---- | ---- |
| Bill Splitter | Complete | Splits <total_bill> a given <num_people> | <total_bill> <num_people> |
| Simple HTTP Server | 2/4 Complete | Runs simple HTTP webserver on port 8080 | None |
| Tip Calculator | Not Started | Calculates tip based on a bill amount | <total_bill> |
| Todo List | Not Started |  |  |
| Net Worth Calculator | Not Started |  |  |

 \*<> denotes a required argument and [] denotes an optional argument

## Bash

Bash/Shell Scripting is not always most useful for these types of projects. For that reason, I have opted not write all of the programs in bash. I am, however, including the bash script `newProject.sh` as an example of a script to automate repetitive tasks. It's designed to set up new projects and create blank scripts for each project. It will also write a simple bash script `runAll.sh` to run all programs from the console one after another.

## newProject.sh
*Help Menu --* `bash newProject.sh -h`
```
Help Menu

Usage:
  bash newProject.sh [options] <project_name>

Options:
  -h,  --help        Prints this message and exits
  -e,  --examples    Prints help menu and examples
  -a,  --args        Declares cli args to pass to the scripts when run
  -d,  --desc        Declares project description (Added to project's README.md)

Note: It's recommended to put args and description in quotes
```
*Examples --* `bash newProject.sh -e` (prints help menu and example menu)
```
Examples:
  bash newProject.sh test
    --> Creates project test
  bash newProject.sh test -a "<arg1> <arg2>"
    --> Creates project test with readme args <arg1> <arg2>
  bash newProject.sh test -d "Test repo" -a "<arg1>"
    --> Creates project with readme description "Test Repo" and args <arg1>
  bash newProject.sh test -d "Test repo"
    --> Creates project with readme description "Test Repo"
  bash newProject.sh
    --> Displays error message and exits
```
