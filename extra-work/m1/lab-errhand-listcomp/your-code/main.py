from math import sqrt
from string import ascii_lowercase
import re
from os import listdir
from random import randint
import sys


#1. Calculate the square number of the first 20 numbers. Use square as the name of the list.
print('\n#1')
square = [x**2 for x in range(20+1)]; print(f"Squares: \n{square}\n")

#2. Calculate the first 50 power of two. Use power_of_two as the name of the list.
print('\n#2')
power_of_two = [2**x for x in range(50+1)]; print(f"Power of two: \n{power_of_two}\n")

#3. Calculate the square root of the first 100 numbers. Use sqrt as the name of the list.
print('\n#3')
sqrt = [sqrt(x) for x in range(100+1)]; print(f"Sqrt: \n{sqrt}\n")
 
#4. Create this list [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0]. Use my_list as the name of the list.
print('\n#4')
my_list = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0]; print(f"My list: \n{my_list}\n")

#5. Find the odd numbers from 1-100. Use odds as the name of the list. 
print('\n#5')
odds = [x for x in range(1, 100+1) if x % 2 != 0]; print(f"Odds: \n{odds}\n")

#6. Find all of the numbers from 1-1000 that are divisible by 7. Use divisible_by_seven as the name of the list.
print('\n#6')
divisible_by_seven = [x for x in range(1,1000) if x % 7 == 0]; print(f"Divisible by Seven: \n{divisible_by_seven}\n")

#7. Remove all of the vowels in a string. Hint: make a list of the non-vowels. Use non_vowels as the name of the list.
vowels = 'a e i o u'.split(' ')
teststring = 'Find all of the words in a string that are monosyllabic'

print('\n#7')
nonVowels = ''.join([a for a in teststring if a not in vowels]); print(f'String w vowels : \t{teststring}\nStrings w/o vowels: \t{nonVowels}\n')

#8. Find the capital letters (and not white space) in the sentence 'The Quick Brown Fox Jumped Over The Lazy Dog'. 
teststring_2 = 'The Quick Brown Fox Jumped Over The Lazy Dog'

print('\n#8')
capital_letters = re.findall('[A-Z]', teststring_2); print(f'String: \t{teststring_2}\nAll caps in string: \t{capital_letters}\n')

#9. Find all the consonants in the sentence 'The quick brown fox jumped over the lazy dog'.
print('\n#9')
consonants = re.findall('[a-z]', teststring_2); print(f'String: \t{teststring_2}\nAll consonants in string: \t{consonants}\n')

#10. Find the folders you have in your madrid-oct-2018 local repo. Use files as name of the list.  
print('\n#10')
# madrid-oct-2018 does not exist in my computer, therefore for the sake of the lab i take the m1 folder
folders = [f for f in listdir('../../../m1/') if f.endswith('')]; print(f'The folders in m1 are: \t{folders}\n')

#11. Create 4 lists of 10 random numbers between 0 and 100 each. Use random_lists as the name of the list. 
print('\n#11')
randList = [randint(1,100) for i in range(10*4)]
random_list = [randList[x:x+10] for x in range (0,len(randList), 10)]
print(f'List of 4 random lists: \t{random_list}\n')

#12. Flatten the following list of lists. Use flatten_list as the name of the output.
print('\n#12')
list_of_lists = [[1,2,3],[4,5,6],[7,8,9]]
flatten_list = [x for inner_list in list_of_lists for x in inner_list]
print(f'Unflattened list: \t{list_of_lists} \nFlattened list: \t{flatten_list}\n')

#13. Convert the numbers of the following nested list to floats. Use floats as the name of the list. 
print('\n#13')
list_of_lists = [['40', '20', '10', '30'], ['20', '20', '20', '20', '20', '30', '20'], \
['30', '20', '30', '50', '10', '30', '20', '20', '20'], ['100', '100'], ['100', '100', '100', '100', '100'], \
['100', '100', '100', '100']]
floats = [[float(x)] for inner_list in list_of_lists for x in inner_list]
print(f'List of list as floats: \t{floats}\n')


#14. Handle the exception thrown by the code below by using try and except blocks. 
print('\n#14')

try: 
    for i in ['a','b','c']:
        print(i**2)
except TypeError:
    print('TypeError: float or integer need for this operation')

#15. Handle the exception thrown by the code below by using try and except blocks. 
print('\n#15')

x = 5
y = 0

try:
    z = x/y
except ZeroDivisionError:
    print('y == 0 is not a valid input')
finally: print('\nAll Done')


#16. Handle the exception thrown by the code below by using try and except blocks. 
print('\n#16')

try:
    abc=[10,20,20]
    print(abc[3])
except IndexError:
    print('Error: Index of out list range. Try Again')
finally: 
    print('All Done.\n')

#17. Handle at least two kind of different exceptions when dividing a couple of numbers provided by the user. 
# Hint: take a look on python input function. 
# Check in provided resources the type of error you may use. 
print('\n#17')

userNum_1 = input('Give me a first number....\t')
userNum_2 = input('Give me a second number...\t')
print('\n')

try:
     if userNum_1.isdigit() and userNum_2.isdigit():
        print(f'[{userNum_1.isdigit()}|{userNum_2.isdigit()}] Begining the operation ...\n')

        if int(userNum_2) != 0:
            result = float(userNum_1) / float(userNum_2)
            print(f'The operation {userNum_1} / {userNum_2} is: {result}')
        else:
            raise ValueError('Zero is not a valid input. Try again!')
     else:
         raise TypeError

except (TypeError):
    print('One of the inputs is not a digit. Try again!')

finally:
    print('Process finished')


#18. Handle the exception thrown by the code below by using try and except blocks. 
# Check in provided resources the type of error you may use. 
print('\n#18')

try:
    f = open('testfile','r')
    f.write('Test write this')

except (FileNotFoundError):
    print('The file does not exist. Check directory')



#19. Handle the exceptions that can be thrown by the code below using try and except blocks. 
#Hint: the file could not exist and the data could not be convertable to int
print('\n#19')

try:
    fp = open('myfile.txt')
    line = f.readline()

    if s.strip() == int:
        i = int(s.strip())
    else:
        raise ValueError('The data could not be convertable to int')
    
except (FileNotFoundError, ):
    print('The file does not exist. Check directory')


#20. The following function can only run on a Linux system. 
# The assert in this function will throw an exception if you call it on an operating system other than Linux. 
# Handle this exception using try and except blocks. 
# You will probably need to import sys

print('\n#20')

try:
    if 'linux' in sys.platform:
    def linux_interaction():
        assert ('linux' in sys.platform), "Function can only run on Linux systems."
        print('Doing something.')

except


### Bonus Questions ###

# You will need to make some research on dictionary comprehension to solve the following questions

#21.  Write a function that asks for an integer and prints the square of it. 
# Hint: we need to continually keep checking until we get an integer.
# Use a while loop with a try,except, else block to account for incorrect inputs.




# 22. Find all of the numbers from 1-1000 that are divisible by any single digit besides 1 (2-9). 
# Use results as the name of the list 




# 23. Define a customised exception to handle not accepted values. 
# You have the following user inputs and the Num_of_sections can not be less than 2.
# Hint: Create a class derived from the pre-defined Exception class in Python
"""
Total_Marks = int(input("Enter Total Marks Scored: ")) 
Num_of_Sections = int(input("Enter Num of Sections: "))

"""
