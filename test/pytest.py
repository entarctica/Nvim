# write a function that counts to 10 in the terminal, clearing the terminal each time
# use the sleep function from the time module to wait 1 second between each number
# use the clear function from the os module to clear the terminal
# use the sys module to get the command line arguments

import sys
import time
import os

def count_to_ten():
    for i in range(10):
        print(i)
        time.sleep(1)
        os.system('clear')

if __name__ == '__main__':
    count_to_ten()
