Welcome to operating systems lecture 1.

This is an introductory lecture and we will basically in this course discuss about operating systems and how they work and what are the issues when you design an operating system and implement one.

## Why to learn operating systems?**

**Firstly, Why is operating systems an interesting thing to learn?**

If you look at the history of computing, most of the landmark events in the history of computing have involved operating system either at the center or as one of the components of the event. So right from 1960s till 2014, operating systems have gone through series of design changes, implementation improvements and has always been an active area of research. So to give you a flavor, in the early days of computing, an operating system used to control large machines for example, the IBM mainframes and allowed people to run multiple processes and allow multiple users to share that large machine and get their work done.

Today operating systems are present in your personal computers, they are present in your mobile phones, they are present in your cars and in all kinds of embedded devices. **There are lots of different open problems that operating system researchers have to face today.**

For example, we are rapidly seeing rapid changes in our hardware. We are going from high performance single core computers to computers which have lots of cores. Small machines like laptops have up to four cores or eight cores and larger machines can have up to 80 or 100 cores, it is not uncommon. And so researchers are constantly asking the question, what is the right operating system for this new kind of hardware and do our current operating systems really fit for these kind of new devices?

Similarly, we are seeing advent of new kinds of devices which need operating systems like phones. Will the operating system that runs on your desktop be the ideal operating system for your phone or something better is needed?

Then there are reliability issues. The operating system that runs inside a space mission, let's say the Mars mission or something has to be very, very reliable, definitely much more reliable than your PC desktop operating system. And so reliability is an operating system issue and it is a constant effort of researchers to ensure that operating systems do not have bugs or have ways to prove that the operating systems do not have bugs.

So all these are also research issues.

**Performance is definitely an operating system issue.** I want to write an application and the application is going to run on a certain set of hardware which includes perhaps multiple processors, each having multiple CPU cores and having memory, disk, perhaps accelerator devices like the GPUs, the graphics processing units, etc. **And how can the operating system allow applications to use all this hardware in the most efficient way?**

And all these are basically very, very interesting software engineering, software design and in particular operating system design problems.

## What is an operating system?

Let's understand what an operating system really is. We're going to try to understand this by looking at the history of operating systems.

The first operating system was perhaps not designed, not very ambitious in its goals. **The goal of an operating system was to allow a program to run.** And so in some sense, **operating system is the lowest layer of software that sits on top of hardware.** And so the first operating system would just export a certain set of libraries that will allow an application to use this hardware.

So the picture would perhaps look something like this.

![image](https://github.com/akshaymalik1995/notes/assets/55041489/0465691c-f516-4f03-b7b5-88513cbd3c7d)


You have, let's say, if I draw the whole system as this box and this is my hardware, then the operating system is basically a bunch of device drivers and the application is running on top of this operating system and making calls into the operating systems to access the hardware. So the application runs on top of hardware, but for some operations it can ask the operating system to do it. And so different applications need to be written for this operating system in this way.

Notice that in this picture, I am only drawing one application running at one time. So there's only one application that's running at any time on this operating system.
And so this is a **uniprocessing operating system**. And so only one application can run at any time. **And the operating system is just a collection of libraries which is allowing the application to access the hardware.**

All right.

**Let's take a step back and let's also understand how a computer system should really get organized.** So one way to organize an operating computer system or a software system is to just write all your software as one big program. So let's imagine a world where your computer, the hardware is still the same, which basically
means there's a processor, there's memory, there's disk, et cetera, and they're all
interconnected just the way they are today. But the software was indeed written in one monolithic style. So there's one large program that's going to do all your things for you. So for example, this program contains the logic to boot your computer from power off state to something which is usable. It contains all the logic to implement your editor, your shell, your GUI, the graphics, a window manager, your browser, web clients, web servers, and all this. So this program could be one large program that has all these things built into it.

And so this program would probably contain one large case statement which says, if the user does this, then go here. If he presses a button here, then go there. If he types this command, then go jump there, and so on. So you can imagine that all your software on your computer can be organized as one big program that has all these things built into it.

It's possible.

But it's not very practical because completely different pieces of logic, an MP3 encoder has nothing to do with the web server, have to be part of the same program, and the developers of these two different logics have to now talk to each other so that they are compatible with each other and can fit inside the same program.

So if there's an update to one part of the program, it basically means updating the entire program.

Moreover, there are trust issues.

What if I want to implement a web server, but I also know that I'm sharing this, I'll be a part of this large program that also runs the MP3 encoder, but I don't trust the developer of the MP3 encoder because perhaps I don't trust his program because perhaps I know that his program may have bugs, or I just don't trust the developer. Maybe he may want to do malicious things to me.

So all these things are completely not possible in this model where you have one large program. And of course, it is also a software engineering nightmare because if you have one large program that's all these things, how is it possible to maintain this over a long period of time?

So in theory, there could be an operating system that just implements all the functionality inside it as one large program and do things. But that's not going to be very practical.

**So typically what operating systems do is expose an interface which allows applications to run on top of the operating system. And these applications can be implemented independently.**

**So one application could be the MP3 encoder, for example, and the other application could be the web server. And these applications can run, can be implemented independently.**

And at one time, let's say one application or multiple applications can run together. They all rely on the same interface that the operating system provides.
And so these applications can run on this operating system as long as they obey the interface. These interfaces, in the picture shown above, these interfaces happen to be the device drivers.

**Multiprocessing operating system**

![image](https://github.com/akshaymalik1995/notes/assets/55041489/d768e0c9-7b5d-48e9-b4be-e7f4e2a30adc)

In yet another kind of interface the operating system exposes certain interfaces and allows multiple applications to coexist at the same time. This is a multiprocessing operating system. So for example, this application could be a browser and this particular application could be, let's say, an MP3 encoder or any other such applications. And now the developers of these two applications don't need to trust each other. They also don't need to coordinate with each other. As long as they meet the specification of the operating system, they can run together
at the same time without having to worry about each other. 

So this kind of an architecture is much better from a software engineering point of view. It's also much better from a security point of view, modularity, and so on. And also performance.

## Operating System Interface

**So let's understand what are these interfaces?** What should these interfaces look like? And that, itself, it turns out, is a non-trivial problem. So what should the operating system interface be?

And let's again trace back to history. So one of the first operating systems was **Multix** that was coming out of Bell Labs. And one of the successors of Multix was Unix. So there was a system called Unix, developed by Ken Thompson, who won Turing award for his work on Unix. And other people involved in this work were Dennis Ritchie and others.

**So what was Unix?**

Well, the first version of Unix, or the early versions of Unix, looked something like this. They said, okay, I want to be able to run multiple processes on my system.

And what should the operating system provide as a minimal sort of interface? So they started with first thinking about, firstly, what are the hardware components? Well, the hardware components are, there's a processor, which we call the CPU. There's memory, which is RAM, right? And then there's disk. Disk has a semantics that its contents are preserved across power reboots. Also, the disk needs to be shared across multiple processes, right? So one process may want to access file A, and another process may want to access file B. They may be running at different times, but the files A and B need to coexist on the disk.

On the other hand, at that time, memory could be assumed to be exclusive. So you could assume that if process A is running, then only process A is using the memory, and nobody else is using that memory.

Notice that for the disk, that's not true, right? For the disk, at the same time, it's important that all the contents of all the different processes, even if the process is not using them, exist.

But for memory, whose contents are volatile, which means they don't persist across power reboots, it's possible for, so you can, at that time, they assumed that a process basically has exclusive access to all memory, right?

Of course, today, we also don't do that. We basically allow the memory to get shared across multiple processes at the same time.

But let's first understand how initially the UNIX interfaces look like.

So the other thing that was important was, one important program that was needed was
an interactive shell, right?

**What is an interactive shell?**

An interactive shell will give you a command prompt. You will type in your command, and depending on the command, some program will get to run, right? When that program finishes, you will come back to the interactive shell. And this loop, and this mechanism will continue forever, right? That was the minimum that a usable computer system should have, okay?

So there are couple of things that are most very important. Firstly, there should have been a file system, right? So the early developers of UNIX said, okay, there needs to be a file system. A file system is an on-disk data structure and some kind of interface to access this on-disk data structure, right?

So let's say, let me draw this disk, right?


![image](https://github.com/akshaymalik1995/notes/assets/55041489/15556a3e-c450-4bf1-8b59-6f2efc637c13)

And you know, this disk has some contents, and a process that runs should be able to, so there is an operating system that sits between the application and the disk.
And the application is going to make some request to the operating system, and the operating system is going to translate those requests to the disk. And this translation layer was also called the file system, okay? And so it is clear that, you know, any operating system needs to have a file system, okay?

So well, the file system in early UNIX looked quite similar to what we have today, which basically means that files, there was a notion of files which were nothing but streams of characters, all right? And there were a notion of file names, right?
And a process could say, I want to access file name A at offset B, and so the operating system will translate the file name into a disk offset and add offset B to it and give you the contents of that particular file.

Also, you know, for better manageability, the earlier file system also had the notion of directories, which basically meant that the files, the file names, the file system or the namespace of the data structure was organized in hierarchical manner, which basically means that file names were basically had a full path name associated with it, basically meant where do you go from and so on, which included starting from the immediate parent directory to its parent to its parent till you reach the root and so on, okay?

So that's one thing that UNIX had to have.

And the way they did this was basically using an interface which said you open a file, which basically means that, you know, I can say I want to open a file foo, then I basically can now use, so when I open a file, I could, let's say, open file name and this would give me what is called a handle or a file descriptor, which I am calling FD. Then I could read on the file descriptor. I could say I want to read in this file and you know, I want to read from this file, which I have opened previously, into a character array buff, 100 bytes, let's say. That basically means that I want to read 100 bytes from this file and store those contents into buff. So or I could say I want to write to this file 100 characters from buff, right? So read basically says read from file and put it into this character array and write means read from this character array and write to this file. 

By the way, what is buff? Buff is a pointer in memory.

So if I look at it again, my hardware looks something like this. I have a CPU on which my instructions run, memory and disk. So the CPU is going to run this instruction, which will call this function called read. Buff will be somewhere here (inside the Memory) and it will have, let's say, 100 characters in it and the file foo will be somewhere here (inside the Disk) and CPU could execute this command called read or write to transfer contents from memory to disk and from disk to memory using these commands. 


![image](https://github.com/akshaymalik1995/notes/assets/55041489/3773fdbb-ec3a-4b9c-b678-3be1e1a405bc)


Notice that the application does not need to worry about which disk it is or how do I access the disk, etcetera. All those things are abstracted away from by the operating system. The operating system knows what disk it is, how to run that disk,
how to write to that disk, etcetera and the interface that the operating system provided or the Unix provided was this `read` and `write` calls that the application could make to read or write from the disk.

That is one thing. The other abstraction that they had was that of a shell. So they said, because the shell or the interactive shell has to be such an important part of the operating system, the shell was implemented inside the kernel. 

So let's say this is the operating system OS and the operating system is also often called the operating system kernel. So I am going to use these words kernel and
operating system interchangeably and let's say this is the hardware once again and one part of the operating system would implement a program called shell. And let's see what the shell does. The shell basically gives you a command prompt. Let's say the command prompt is dollar and then you type a command, let's say you type a command `browser`. So what the shell is going to do is it is going to check, treat this command as a file name. **It is going to search for this file name in the current directory where the shell is running and if it finds the file name, then it is going to treat that file as an executable program and it is going to run it.**


![image](https://github.com/akshaymalik1995/notes/assets/55041489/2ddf88bb-7ea4-4a5b-b608-9b4b0a361ac5)


So let's say a `browser` was a file that existed in the current directory on in which the shell is running, then that file will get loaded as an application and control will get transferred to the browser. 

So notice that basically the operating system is providing interfaces for you to run different programs and allowing different programs to coexist simultaneously on the disk. At this point we are assuming that only one program is present in memory at any time. And this is a special program called shell inside the operating system or the operating system kernel and this shell is going to take a command from the user which basically means it is going to read from some port, let's say the keyboard. It is going to read from the keyboard, interpret that command as a file name. It searches for the file name in the disk in the file system really and if it finds a file with that name then it loads that file name. So that file basically should contain some data some instructions that need to get executed. So those instructions get loaded into memory and control is transferred to that particular file program. That program is now going to run all by itself. So it is as though nothing else is present in memory, it is just that program that is present and so that program is going to run all by itself and when it is running it may make more open calls to open more files, it may make more read calls or write calls to you know to read or write files and at some point it may want to say I am done, I want to exit. 

So that was how was exit implemented in UNIX. So there needs to be something called exit in early UNIX. So how do you exit? Well at that time, so in the early version of UNIX, exit was basically implemented by just returning back to the shell. So if  there was another function that the operating system kernel provided which was exit and what that will do is it will remove this from memory and jump back to the shell to take the next command. So you have to print the next dollar sign and here you are and you can now print your next command. 

There were other things that the operating system had to be careful about. 

Firstly, if the browser had opened certain files then when you return back to the shell, the first thing the shell would do is close all the open files so that if the new program gets to run he can open more files and so on. 

So this was the simplistic model of the UNIX operating system in its early days. And
basically what we have seen is there are few things that the operating system was providing us. Number one, it allowed us to start a new program, start slash load a new program and this it was being done using the special program called shell inside the operating system. It allowed us to open, read and write files and it allows us to exit. So these are some of the functionalities of OS that applications uses and we have seen how they are using it. 

So notice that in doing this, in doing this operating system design, the designer has just basically carefully decided that some part of functionality needs to be part of the operating system kernel. For example, the shell program is part of the operating system kernel and the device drivers are part of the operating system kernel and some part of the logic does not need to be part of the operating system kernel and it should be present as application logic in executable files. That can be executed by the user at will. Even very soon people realized that you know even the shell does not need to be part of the operating system kernel. One of the important things that go into an operating system design is to make the interface as small as possible and as usable as possible and yet as powerful. 

So today the operating system kernel does not provide the shell command. Instead the shell itself runs as a separate application. And the shell has ways to tell the operating system to start another application. So for example, the shell could tell the operating system to suspend itself and start a browser just like before except that this time the shell is not part of the operating system. The shell itself is running as an application and in order to do that it is important that you have interfaces that allow an application to be able to create another application and jump to it. 

So these functions that the operating system provides, the functions that basically form the interface of the operating system, are called **system calls**.

Some examples of **system calls** are calls to allow you to start a new program or to read or write to a file on the disk or to exit and there are more system calls that we are going to look at as we study this course further. 

So let us continue with this particular model where we said that the shell itself is written as an application and the operating system provides certain interfaces to
allow the shell to start another program. 

So what are these interfaces? So UNIX provides a system called `fork` and another system called called `exec`. These system calls are used to start a new program. Let us see how fork and exec are used. 

So first let us talk about exec right. So let us say I am an operating system and an application is running here

let us say it is a shell. The shell can make a system call called exec. So exec takes an argument

which says file name and what happens if a program called exec system call is that firstly the operating

system will search for that file name in the file system. So it searches for the file name in the file

system to find you know in the current directory to find if there is a file with that file name.

If it is there and it is executable then it replaces the shell with that particular file name.

So let us say the file name was browser then the shell will get replaced by the file name.

So exec is a way for one program to load another executable from the disk right and it is done

using the file name. So there is a file name that the program gets that says I want to run this

particular program but the problem is that once you do that you yourself are no longer there.

So at the point when you call the exec system call you are the one who is occupying memory.

As soon as you call exec the operating system removes you from the memory and instead loads

the contents of that executable into memory and transfers control to it right.

So essentially that means that if a shell program ever calls exec then the shell program will never

get to run again right. It will be the new program that will run and when that program

calls exit it is no longer the case that the control will get transferred back to the shell

unlike in the original UNIX right because in the original UNIX the shell was part of the

operating system kernel and so it was possible to jump back to it but here because the shell

was an application and the application has called exec so it has completely removed itself

from the picture right and all its state has been wiped out and so there is no way that

operating system can jump back to the old program. Notice that the operating system doesn't

even know that this particular program is a special program called shell right it is

just one of the different programs and it doesn't know what point it was in when the

exec system call was called so it has no way of reconstructing that program back again.

So exec is one way to load another program but it also means that you know I completely

get washed out and there is no way that I can return control to myself later on ok.

So that is not good enough for us to be implement the functionality of shell as we know it right

because the shell as we know it basically allows us to type a command the command gets

executed and when the command exits the shell can run back again right so that is something

that we want and exec is not going to do the last part which is return back to the shell.

So the other system called fork can perhaps help so let's see what fork is doing right

so what is fork well fork basically let's say there is a program called shell that is running

it calls a system called called fork what happens is when it calls the system called

fork two different apps get created simultaneously identical to each other it's like you know

a parent so one child one process creates an identical replica of itself using fork right

so the two shells that get created and at any time only one shell can run so what the fork

system call is going to do is it is going to create two copies of itself with identical

state right and identical state and identical value of the program counter so they are going

to both be executing the same next instruction when they call fork of course in our model

we are saying that only one program can run at any time so what will happen is one of

them let's say the so firstly one of them is called the parent the one who called fork

and the other one is called the child right the program that called fork is called the

parent and the program that just got created or the process so that just got created is

called the child so a little bit of terminology here there is a program which exists as an

executable on disk and there is a process.

Which is a running program the exit system call takes a program and converts it into

a process a running program the process runs and you know it changes its own state so process

is has its own state in memory and it has it runs it changes its own state and at some

point it calls exit let's say so initially the shell was running as a process the shell

made the fork system call and it created two processes the parent process and the child

process right now at any time only one process can be active let's say if it is a uniprocessing

system then let's say the child process gets stored to disk and the child process gets

to run and so that so that is the semantics of fork but our real goal was to be able to

implement the shell functionality so what what what can be done is that the parent process

creates a child process and the child process now calls exec.

So, what happens is the parent process still exists exactly at the point where it had forked

the new process the child process can now load the new program which basically means

the shell gets wiped out and instead gets replaced by the browser right the browser

can get to run and at some point the browser will call exit in which case the whole process

will get wiped out right. So, so we seen that there is a system called

called fork that allows you to create a new process which is a replica of the the process

that called fork and there is a system called called exec that allows you to stop the current

process or completely free the current process and there is a system called called exec which

allows you to replace the contents of the current process with the new program right.

Now using this these two system calls fork and exec it's now possible to implement a

shell like program as an application. So, for example a shell will fork first called

fork so it will create two copies of the shell the child copy of the shell will call exec

on the command that you gave on the command prompt the command will get to run when the

command finishes it is going to call exit. So, that process gets wiped out the old shell

the parent shell that was stored on disk gets loaded into memory and continues from where

it left off right. So, that is you know that is one way that you can implement the shell

functionality. So, as opposed to having the shell as part of the operating system kernel

it is a much more modular way to actually have this the shell also as a separate program

much more powerful way instead in fact to have the shell as a as an other application

and have the special system calls called fork and exec that allow you to implement the same

functionality as the shell. In fact, the system calls fork and exec can be used by any application

right the shell is just one of the applications and the kernel does not even know that this

is a shell right it can be just any other application. So, any application when it calls

fork allows an creates replica processes of the parent process and any process that

calls exec is going to load the file into the current process.

There are few things that I have skimmed over one is when a system call when a fork system

call is called then the two processes that return from the fork system call. So, fork

is a system call that is called by one process, but returns in two processes right. So, one

process calls fork and two processes return from fork at exactly the same program counter

right. So, but I, but there was a difference I said the child will execute the exec system

call next if it wanted to implement the shell functionality while the parent will just print

the next command prompt. So, how do you do this because because the two programs are

completely identical they are twins how do you how do you decide whether I am the child

and I should call exec or whether I am the parent and I should actually display the command

prompt. Well, so the fork system call is has a return value. So, the syntax of the fork

system call is fork returns a return value which I call the PID or process ID and the

return values are different in the parent and the child. So, let me just draw this as

a picture. So, let us say this is process. So, firstly every process has an ID. So, let

say this is process 10 which basically means each process has an ID. So, this process has

an ID of 10. So, PID is equal to 10 this process makes a system call called fork and the operating

system returns from this system call, but it returns in two places. So, it creates another

process let us say it creates another process another child and this child has a PID of

20 PIDs are assigned by the operating system. So, it can choose any way of assigning the

operating thing and this one also returns behaves as if it has just returned from fork.

This particular process did not ever call fork, but it behaves as though it has just

returned from fork. Both of them are going to return at exactly the same program counter

except that the return value in the parent will be different from the return value in

the child. So, in the parent the return value is the PID of the child. So, the return value

in this case will be 20 right. So, fork's return value let me just write this is PID

of child. So, there are two return values one is for the parent in the parent process

the return value is PID of child and in the child process it is some number which cannot

be a PID let us say 0. So, here the return value is 0. So, all that you need to do all

that all that the programmer needs to do is to check the return value if the return value

is 0 then I will call exec if the return value is non-zero then I will print the next command

prompt for example. So, let me just write this more formally I am going to write the

shell program very basic it looks something like this it is an infinite loop just continues

till the user types exit or you know just something else to basically stop it. But,

otherwise it just keeps running and it has some function to read command how it reads

the command let us just abstract it out let us say there is some function which is read

command you know it is going to make some system calls internally to basically read

the command this read command is not a system call it is I am just using this function as

a place holder to say you know it will call other function as a place holder.

So, this calls that we will discuss later and it will say PID is equal to fork this is

a system call let me write another color system call right and then I will write the system

then I am going to check if PID is equal to 0 then exec command right whatever you read

from here else let us say you know else you just read the next command. So, what is happening

here is the program that will you know at a very basic level implement the shell functionality

it reads a command calls fork in the child process it calls exec and in the parent process

it just reads the next command right. So, this will exactly do what we wanted it to

do basically which means it will execute the new program and allow the previous program

to do this to repeat the same thing again, but the previous program will probably get

to run only after when the new program has finished for example.

So, this is a uniprocessor sort of uniprocessing environment where only one process gets to

run and let us assume that the child process gets to run first. So, child process is going

to run and when it calls exit then it is going to go away and the parent process is going

to get to run now and the parent process is going to go back in the loop and read the

next command right. So, that is what is happening in this loop. So, there are many details many

things that have omitted here, but it is important that before we go there you understand the

functionality of fork and exec and the use of fork and exec.

Now let us understand how do you read the command right. So, typically we think of read command

as something which is being read from the keyboard right. So, the user is typing some

command he presses enter that is a command. So, how do you allow an application to read

the key is being pressed on the keyboard right. Similarly, how do you allow an application

to be able to write characters on the console right. So, both these things are mediated

by the operating system and in general any resource that is a shared resource which needs

to be shared across multiple applications is usually mediated by the operating system

kernel right. Because if anything is shared then the operating system needs to make sure

that there are no concurrent accesses by multiple applications that are you know different applications

are not stepping on each other stores for example right. The operating system needs to

mediate in the middle some examples are we just saw that the file system is a way to

for the operating system to allow mediation of the disk blocks right. So, the file the

the file system is basically in on disk data structure that is shared by multiple processes

and the operating system basically exposes functionality like open read right to allow

applications to access this these disk blocks which are shared.

Similarly the keyboard and the console and the other hardware devices are shared resources

and different processes may need to access these these shared resources and once again

all these hardware devices the access to these hardware devices is mediated by the operating

system. One contribution of the UNIX system was this was a general interface to be able

to mediate to be able to use across a variety of devices and other shared resources and

this interface is open read right and close. So, I can say open a resource and then open

a resource which and I name the resource using a name and it will return a file descriptor.

So, we have seen this before right, but we are seeing this in the context of files only

but the same thing can be applied to other things like devices like the keyboard and

the console and how we are going to see various. So, when an application says open that is

the time when the operating system is going to check whether let us say somebody else

is using that resource if so perhaps operating system may want to say no I will not allow

you to open it in which case the open can return an error right.

So, typically you know these system calls return positive values and if they return

a negative value like minus 1 it indicates that the system called failed. So, if an application

calls an open system call and it gets minus 1 return value basically means that the device

was not the file or the device was not open. Once you open if let us say you opened a file

name and a file descriptor was returned which was a non negative value then that file descriptor

can be used to as an argument to future calls which are read.

Now, we have seen this before read buff size right read and write to that resource. Once

again that the operating system can decide whether it allows read on this particular

file descriptor or not. So, for example, if I try to read from the console you know I

should get an error. So, you know it has a return value which can be which can be negative

which basically means over that your read was illegal. So, I should not be allowed to

read from something which is an output device or output file. Similarly, I should not be

able to write to let us say the keyboard or to a file which is a read only file and so

on. So, the nice thing is because of the center phase operating system gets to also in check

or do perform access control for the applications to the shared resources. And then finally,

you could do close file descriptor to close that particular file right which basically

means that I am done with this particular file and other people can let us say use it

etcetera. So, it allows the operating system to know who has which files open ok.

So, let me take this a little further. So, how is the file descriptor returned? It turns

out there is also a way there is also a convention in which these file descriptor numbers are

returned. So, whenever a file a process called open a certain file descriptor number will

get returned and let us understand what this convention is. So, we said there is a number

of functions in the notion of a process right a process is a running program. So, let us

say I am drawing a process as a rectangle and there is a program that is running inside

it let us say the program is browser. Each process also has certain state called the

file descriptor table and the file descriptor number is the number of functions. So, the

function and this file descriptor table is hidden from the program I mean the program

cannot access it directly, but the program can manipulate it using open and close calls.

So, when a program calls open the operating system searches for the first available file

descriptor and. So, let us say I say open foo I search starting from the beginning. So,

the file descriptor table has key value pairs the keys are numbers starting from 0 till

some maximum value right and the values are structures which contain whether it is opened

or not whether and whether and if it is open what are its width per cell locations. For

example, you know 0 could be pointing somewhere 1 could be pointing somewhere else 2 could

be pointing yet somewhere else and 3 may be empty. So, when I say open foo what will happen

is the operating system will go through the file descriptor table look for the first unused

FD which is 3 and it is going to put foo here and return 3 right that will be the return

value to the application. The application can then use read write close on this file

descriptor to read or write to this file as we saw. The first 3 file descriptors 0, 1

and 2 are special they are called standard input or STDN or STDN. So, the first 3 file

descriptors standard output that is 0 this 1 is standard output STD out and 2 is standard

error. So, process has 3 special file descriptors 0, 1 and 2 which are standard output and

which refer to its standard input or there are special names for these 3 file descriptors

and the names are standard input, standard output and standard error. The idea is that

a program typically will read from its standard input and write to its standard output and

if there is an error it will write to the standard error port. So, if I am a shell program

then I will always read from my standard input and write to my standard output. I do not

care whether the standard input is the keyboard or something else I do not even care whether

the standard output is the console or something else. The program is written the semantics

of the program are that it reads from the standard input and writes to the standard

output and somebody else let us say the operating system is responsible for deciding what is

the standard input for this program and what is the standard output for this program. So,

let us assume that the standard input. So, let us assume that the standard input the

zero or standard input is points to the keyboard and standard output points to the console

and standard error also points to the console. So, now if the program calls write on file

descriptor 1, hello 5 basically says I want to write print disk buffer which has 5 characters

in it then that program is effectively writing the string hello on the console. If the program

says read from standard input some characters into a character array buff which he may

have declared of some size let us say 100 then it will read a maximum of 100 characters

but if the user press 100 you know enter before the 100 characters that is also fine.

So, it is going to read some set of characters from the keyboard from to this buffer. So,

that is the way you read or write to or from the console or the keyboard.

And notice that very elegantly and very smartly the operating system designer has used the

open read write close system calls to also be able to read or write to the devices and

not just to the files. So, we are going to continue this discussion in next lecture and

yeah that is it for today. Thanks.

.

