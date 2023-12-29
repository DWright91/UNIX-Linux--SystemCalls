# UNIX-Linux--SystemCalls
Purpose: The objective of this project is to gain experience with UNIX (Linux) system
calls and additional C language features.
Requirements:
1. This assignment is an individual assignment: You are expected to produce your
own solution to the assignment.
2. Overview: You are to write two programs, interface and db. After initialization,
interface will use the fork system call and an exec system call to start the
execution of db. Interface will accept commands from the console and send them
to db for execution. After executing the command, db will send the output to
interface for display on the console.
3. Pipes: interface will need to create the pipes to be used for communication
between itself and db prior to doing the fork. Use two pipes, one for sending
commands to db and one for sending the response to interface.
4. Interface: In addition to tasks described elsewhere, interface must pass the pipe
file descriptor values to db. Use the arguments on the exec command for this
purpose. interface should also detect the final exit status of db and display an
appropriate message.
5. DB: When db initializes, it must do two things before entering its loop accepting
commands. First, it must initialize an array of structures (records) using the data
in a local file called accountData. This file must contain data for at least twelve
records. Second, it should display the contents of the array so it is easy to verify
that the initialization occurred correctly. The records will keep track of a set of
bank accounts. Each structure in the array is to consist of the following fields:
• id: this is the identifier of the account. It is to be a long integer.
• checkNumber: the check (or transaction) number (int).
• amount: The amount withdrawn from the account (float).
• date: The date of the transaction (char).
You are to create and use a typedef for the record structure.
CSCI 311 / 312 Fall 2021
2
6. accountData: each line of this ASCII file is to contain the data for one record of
the array of structures. Each line is expected to be in the form:
id checkNumber date amount
where a single space is used as a delimiter.
7. Makefile: Write a makefile to control the compilation of your programs.
8. Commands: Four commands must be processed:
• account,<id>
This is to compute the total value of all transactions identified by the label <id>.
• list
This will list all of the transactions ordered first by id and then for each id
ordered by increasing date. (Note: it is assumed that some sorting will
have to be performed; the elements must be initialized in a different
order.)
• date,<date>
This is to compute the total value of all transactions that occurred on the
given date.
• exit
After processing this command, db should terminate in a normal manner.
After detecting the termination of db, interface should print relevant
information and exit normally.
9. System calls: You should view this exercise as an opportunity to try out various
system calls. Detailed documentation of the system calls can be found in the
associated man pages. At a minimum, you are expected to use the following
system calls: fork, some type of exec call (such as execl), pipe, read, write, exit,
waitpid, close. In addition your code is to check the response from the system
calls for errors, display an appropriate error message and take appropriate action.
In many cases that action may be just to call exit with a unique number selected.
10. Readability: Your program must be written using good C programming conventions:
• Variable names and function names should be descriptive of what they
represent.
• Use indentation to show the structure of the program. Typically this
means using indentation with for, while, do-while, if, and switch
statements as well as indenting the body of functions. Indentation should
show the nesting level of the statements involved.
• Include some in-line documentation to give a high level view of what the
program and groups of statements is/are doing.
CSCI 311 / 312 Fall 2021
3
Sample output:
element[0]: id = 1234567, check Number: 102, date: 08/11/21, amount: 4.00
element[1]: id = 1234567, check Number: 101, date: 08/14/21, amount: 14.00
element[2]: id = 3456787, check Number: 9873, date: 08/30/21, amount: 100.00
element[3]: id = 1234567, check Number: 100, date: 08/16/21, amount: 35.00
element[4]: id = 3456787, check Number: 9874, date: 09/30/21, amount: 4.00
element[5]: id = 12345, check Number: 1010, date: 09/01/21, amount: 34.00
element[6]: id = 1001001, check Number: 905, date: 08/14/21, amount: 9.00
element[7]: id = 1001001, check Number: 903, date: 08/30/21, amount: 11.00
element[8]: id = 12345, check Number: 1001, date: 09/14/21, amount: 16.00
element[9]: id = 12345, check Number: 1111, date: 08/24/21, amount: 2.00
element[10]: id = 1234, check Number: 1112, date: 08/31/21, amount: 44.00
element[11]: id = 1001001, check Number: 902, date: 09/25/21, amount: 19.00
Input command (account,id | list | date,mm/dd/yy | exit):
account,1001001
response: Total for account 1001001: 39.00
Input command (account,id | list | date,mm/dd/yy | exit):
date,08/14/20
response: Total on date 08/14/21: 23.00
Input command (account,id | list | date,mm/dd/yy | exit):
account,1234567
response: Total for account 1234567: 53.00
Input command (account,id | list | date,mm/dd/yy | exit):
exit
response: db complete.
interface: child process (212) completed.
interface: child process exit status = 0.
interface: Complete.
Hints:
Some of the library string functions may be useful: strchr, strcmp, strncmp, strncpy.
Turn-in:
1. A listing of your program.
2. Output that demonstrates that the code performs correctly. Create a data set of at least 12
elements and show that your results are correct. Note that the evaluation of your code
may be performed with a larger data file. Also, consider abnormal cases as well.
3. You must do the project on the Virtual Machine: 199.17.28.75.
4. Leave a copy of your source (.c and .h files), Makefile, data file (accountData) and
executable files under your Coursefile work folder for this class in a folder called
Project2.
Turn in a copy of your Project 2 results (program listing and output), makefile,
and data file (accountData) to the D2L Assignment folder for Project 2.
CSCI 311 / 312 Fall 2021
4
Grading of this assignment will assign points approximately as follows:
a. Readability (10%): readability of code (is code documented, are indentation
conventions followed, use of self-documenting variable names, etc.)
b. Correctness (60%): Does your program meet the requirements; this includes
correct execution.
c. Testing (30%): The completeness of your testing will be examined.
