#Eingaben

inp = "id:=id*(id+id)"

terminale = ("id","(",")", ":=", "+", "-", "*", "/", "$$")

parsetabelle=(
            {"id":(1),"$$":(1)},
            {"id":(2,1),"$$":()},
            {"id":("id",":=",3)},
            {"id":(5,4),"(":(5,4)},
            {"id":(),")":(),"+":(8,5,4),"-":(8,5,4),"$$":()},
            {"id":(7,6),"(":(5,4)},
            {"id":(),")":(),"+":(),"-":(),"*":(9,7,6),"/":(9,7,6),"$$":()},
            {"id":("id"),"(":("(",3,")")},
            {"+":("+"),"-":("-")},
            {"*":("*"),"/":("/")},
            )

##Scannen der Eingabe

def pre_process(inp, terminale):                     
    eingabe=[]
    stash = ""      #stores characters that are not a terminal (yet) (important for e.g id)
    for a in inp:
        #add stash to current character   
        a=stash+a
        #if its a terminal, put in list, and empty stash
        if a in terminale:
            eingabe.append(a)
            stash = ""
        #store character
        else:
            stash += a
    eingabe.append("$$")
    #Check if stash is empty - if not there are characters that are not terminals
    if stash != "":
        print("ERROR: These are not Terminals")
        exit ()
    else:
        return eingabe

#Aufruf
liste = pre_process(inp, terminale)


##Parsen
stack=[0]      #the to-do list
output=""      #the checked-off terminals

#as long as stack is not empty
while stack!=[]:

    #catches the case that our word is done but the process is not
    if liste == []:
        print("ERROR: not a possible word")
        exit()

    #take away first of stack and get first of list of the string we want to do
    symbol = stack[0]
    del stack[0]
    anf = liste[0]


    #if we reach a terminal, we want to output it and get it off the list
    if symbol in terminale:
        output+=liste[0]
        del liste[0]
        continue

    
    else:
        #if we encounter an error, the language dosnt allow it
        try:
            #get the current row
            row = parsetabelle[int(symbol)]
            #if else for the case of 1-tupel. then we the process to the stack
            if type(row[anf])==int or type(row[anf])==str:
                stack = [str(row[anf])]+stack
            else:
                for a in list(row[anf])[::-1]:
                    stack = [str(a)]+stack
        except:
            print("ERROR: not a possible word")
            exit()

print(output+" gehört zur Sprache")
