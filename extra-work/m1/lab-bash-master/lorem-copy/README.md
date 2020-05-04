# Bash Lab

## Intro

Lets practice with `bash`, a programming language that executes in the command line!

...but first things first, create a `solution.txt` file where you will write every command that you will use during this lab.



## Setup

1. Locate at ../lab-bash-master folder. Execute `ls` 
```console
$ ls
```

2. You should see: 
```console
exercices  inputs  lorem  lorem-copy  modules  outputs  README.md
```
3. Try to solve all exercises without changing folders. 



## Exercises

* Print `Hello World` in console.

* Create a new folder named `new_dir`.

* Delete `new_dir` folder.

* Make a copy of `sed.txt` (located in the lorem folder) to lorem-copy. 

* Copy the rest of the files located in lorem to lorem-copy using only one code line (tip: use `;`). 

* Locate at lorem folder and show `sed.txt` content.

* Locate at lorem folder and show `at.txt` and `lorem.txt` content. 

* Locate at lorem-copy folder and show the first three lines of `sed.txt`. 

* Locate at lorem-copy folder and show the last three lines of `sed.txt`. 

* Add `Homo homini lupus.` at the end of `sed.txt` located at lorem-copy. 

* Locate at lorem-copy folder and show the last three lines of `sed.txt`. Now you should see `Homo homini lupus.`. 

* Change every `et` to `ET` in `at.txt` located at lorem-copy (tip: use `sed`). 

* Find the active user of the system.

* Find out where are you located within the system.

* List all `.txt` files located at lorem.

* Count the number of lines in `sed.txt` located at lorem. 

* Count the number of **files** which name starts with `lorem` located at the whole lab directory.

* Count the number of times `et` appears in `at.txt` located at lorem.

* Count the number of times the **string** `et` appears in `at.txt` located at lorem.

* Count the number of times the **string** `et` appears in every file located at lorem-copy.



## Bash files

Any bash command can be save in a file and be executed from it anytime (you may use your preferred editor like **nano**. If you feel smart and strong **vi** is also an option: https://www.howtogeek.com/102468/a-beginners-guide-to-editing-text-files-with-vi/).

Lets create the bash file: 
```
$ vi list_files.sh
```

And include commands, for instance, the list files command:
```bash
#!/bin/bash
ls
```

Execute the script:
```
$ bash list_files.sh
```

We'll see the following output. 
```console
exercices  inputs  lorem  lorem-copy  modules  outputs  README.md
```



## Bonus

* Load your name in the variable `name`.

* Print that variable.

* Create a folder named after the variable `name`.

* Delete that folder. 

* For every folder in `lorem` print the total number of characters of every file name. 
Try using a **for** loop to show every file name.  
    1. Print every file.
    2. Print the number of characters of every file name.
    3. Print the number of characters of every file name with the following format: `lorem has 5 characters lenght`

* Show the system processes being executed (show them hierarchically):
    1. Using top or htop commands.
    2. Using ps command with arguments.

* Show processor info on screen.

* Create 3 new alias and make them available everytime you login your session.

* Compress lorem and lorem-copy folders in a file named lorem-compressed.tar.gz

* Uncompress lorem-compressed.tar.gz in lorem-uncompressed folder.
