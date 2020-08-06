"""
Question : Implementation of Language recognizer for set of all strings over input alphabet ∑={a,b}
containing even number of a’s and even number of b’s.
"""
#Taking the characters to be recognized as 'a' and 'b'.
inp = input("Enter Input String : ")
state_a = 0 
state_b = 0
for i in range(0,len(inp)):
    if inp[i] == 'a':
        state_a += 1    
    if inp[i] == 'b':
        state_b += 1
        
if state_a%2==0 and state_b%2==0:
    print("String Accepted")
else:
    print("String Invalid")