"""
Question :
Implementation of Language recognizer for set of all strings ending with two symbols of
same type.
"""


"""
Simple Program:

st=input("Enter the string to be checked : ")
if st[-1]==st[-2] :
    print("String Accepted")
else :
    print("String Declined")
"""

#Program using DFA:

st=input("Enter the string to be checked : ")
state=0
for i in range(len(st)):
    if st[i]==st[i-1] and i+1==len(st):
        state+=1
if state==1 :
    print("String Accepted")
else :
    print("String Declined")
