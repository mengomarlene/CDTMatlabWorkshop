# Introduction to Bash Shell
(material inspired from: http://swcarpentry.github.io/shell-novice/index.html)


In this session we will look at some basic aspets of the bash shell.

To get started you should open a bash shell and type

    cd M:
    git clone https://github.com/mengomarlene/CDTMatlabWorkshop
    cd CDTMatlabWorkshop

## Exercise 1 -- navigating and working with files and directories
1. List the content of the directory.
pwd
ls

2. Create a directory inside the 'data-shell/users' directory. Use your name for this new directory
cd data-shell/users
mkdir marlene

3. Create a file called "aim.txt" in your new directory which includes some text outlining what you want out of this workshop.
notepad marlene/aim.txt

4. Rename 'data-shell/users/nelle/notes.txt' to 'data-shell/users/nelle/toDoList.txt'
mv nelle/notes.txt nelle/toDoList.txt

5. Copy all files from 'data-shell/users/nelle/' into your new directory
cp nelle/* marlene/

6. Delete '.tmp' file inside 'data-shell/users/larry'
rm larry/.tmp

7. Delete nelle's directory 'data-shell/users/nelle'
rm -r nelle/

## Exercise 2 -- find the file with the largest number of lines
1. List the number of lines in all molecules listed in the molecule directory within your user directory
cd marlene/
ls
ls molecules/
wc molecules/*.pdb
wc -l molecules/*.pdb

2. Write the output of 1. into a file called length.txt
wc -l molecules/*.pdb > length.txt

3. Display the content of length.txt sorted by number of lines
cat length.txt
sort length.txt

4. Write the sorted outcome into a file called sorted_length.txt
sort length.txt > sortedLength.txt

5. Display the first line of sorted_length.txt
cat sortedLength.txt
head -n 1 sortedLength.txt

6. Do 4-5 in 1 command
sort -n length.txt | head -n 1

7. Do 1,4,5 in 1 command
wc -l molecules/*.pdb | sort -n | head -n 1