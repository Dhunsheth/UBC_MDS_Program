# DATA 541: Scripting and Reporting

# Assignment 2

## Objective

1. Understanding the concepts of shell scripts
2. Writing small scripts to perform common tasks
3. Learning how to access a remote server using SSH


## Part 1: Shell Scripting (12 marks)

**Question 1 (2 marks)**: Write a shell script named `reverse.sh` that take numbers as command line arguments and displays them in reverse order. The program will first show information on the numbers that a user has entered and then in the following line, it will show the numbers in reverse order.

Output:

```
./reverse.sh 11 22 33
You have entered: 11 22 33
Reverse order: 33 22 11
```
File to submit: `reverse.sh`

Useful commands: `$#`, `${!i}`, `man` 

**Question 2 (2 marks)**: Write a shell script named `directory.sh` that shows the directory from where a user is executing the script (see the output). If a user runs the script from the Home directory, it will show a message showing that the script is executed from the "Home directory". Otherwise, it will show the user's current working directory.

Output:

```
khalad@DESKTOP:~$ ./directory.sh                # I am at my home directory
The script is executed from your Home directory 
khalad@DESKTOP:~$ cd /                          # Navigating to the root directory
khalad@DESKTOP:/$                               # Now I am at the root (i.e., /)
khalad@DESKTOP:/$ /home/khalad/directory.sh     # Executing the script from the root
The script is executed from the / directory
```

File to submit: `directory.sh`

Useful link: [Home directory](http://www.linfo.org/home_directory.html)  

**Question 3 (2 marks)**: Write a shell script name `filesize.sh` that prompts a user to enter a file path (e.g., `/home/khalad/readme.md`). If the file doesn’t exist, it shows an error message (e.g., `File doesn’t exist`) to the user. Otherwise, it shows the file size in bytes.

Output:

```
khalad@DESKTOP:~$ ./filesize.sh
Enter a file path: /home/khalad/readme.txt
File doesn't exist
khalad@DESKTOP:~$ ./filesize.sh
Enter a file path: /home/khalad/readme.md
/home/khalad/readme.md file size: 34 bytes
```

File to submit: `filesize.sh`

Useful commands: `wc`, `--help`, `man` 


**Question 4 (2 marks)**: Write a single line pipe command that reads the `input.txt` file and takes only first three letters from each line. The output translates all lowercase letters to uppercase letters and then show the results in a descending order.

Output:

```
THI
SEC
FOU
FIR
FIF
```

File to submit: `input.sh`

Useful commands: `tr`, `sort`, `--help`, `man` 

**Question 5 (4 marks)**: `phonebook.txt` file contains contact information from a phonebook where all the names and phone numbers are stored in a tag-based language. Here a person's name is stored between `<name>` and `</name>` tags and phone number is saved between `<phone>` and `</phone>` tags. Write a bash program called `extract.sh` that reads the `phonebook.txt` file and extracts the name and phone number from the file. Note that the program output shouldn't include any of the tags (i.e., `<name>` or `</name>` or `<phone>` or `</phone>`). 

Sample Output:

```
Name:  Alex Phone:  212-212-2121
Name:  Robin Phone:  202-202-2020
Name:  Lisa Phone:  191-191-1919
```
File to submit: `extract.sh`


## Part 2: Remote Login and SSH (8 marks)

**Question 1 (8 marks)**: Write all the commands in a text file and include the screenshots (as instructed) to perform the following actions:
1. Generate a key pair on your local machine for SSH authentication
2. Copy the public key to the following remote server:
```
IP Address: 147.182.205.187
Username: root
Password: data541UBCO
```
3. Use SSH to log in to the remote server from your local machine. 
4. Navigate to the SSH folder on the remote server and find your public key from the `authorized_keys` file. Take a screenshot (of the console) showing your public key information from that file.
5. Write a command to save the remote server’s environment variables into a text file. 
6. Logout from the server. Download the text file from the server to your local machine (use `scp` command). 
7. Issue a command to display the environment variables on your machine. 
8. Compare the environment variables between the local and remote machines. In the text file, write three differences that you found in the variable values. 

Files to submit: The text file (please add 1, 2, .., 8 when answering the steps) and the screenshot.