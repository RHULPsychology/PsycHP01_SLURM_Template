#!/usr/bin/python

### This sample python script takes a user input from the command line and prints a "Hello World" statement. 
# import os and sys python packages are required for this basic functionality

import os
import sys

subject = sys.argv[1]           # This line accepts the user input and assigns it to the variable subject 
print ("Hello World Subject"+str(subject))     # The actual print statement
