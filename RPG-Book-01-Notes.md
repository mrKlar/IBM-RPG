# The AS/400 & IBMi RPG & RPGIV Developer's Guide
My attempt at recording useful notes from the following textbook: <br>
[The AS/400 & IBMi RPG & RPGIV Developer's Guide by Brian W. Kelly](https://www.amazon.com/gp/product/0998268313/ref=oh_aui_search_detailpage?ie=UTF8&psc=1)


## Chapter 01 - Introduction to the RPG Language
* **RPG** - Report Program Generator
  * IBM - 1959
  * Original Purpose: Generation of reports from data files.
  * Originally designed for punch card machines.
  * Business application programming language for small to medium sized businesses.


## Chapter 02 - The History of the RPG Language
(Not the full history, but some of the highlights)
* **RPG I** - 1959/1960
* **RPG II** - 1969
* **RPG III** - 1978
* **RPG/400** - 1988
  * Introduced with the AS/400
  * Included the following compilers:
    * RPG38 System/38-compatible RPG III
    * RPG36 System/36-compatible RPG II
    * RPG AS/400-compatible RPGII (RPG/400)
* **RPG IV** - 1994
  * Also known as **ILE RPG** or **RPGLE**
  * The 'D' Spec (More on this later)
  * New operations 
  * Modularity - Modules can be written in multiple languages and bound together using an ILE program.
  * Larger size fields - spec increased to 100 characters to allow 10-character field names.
  * Implementation of a date data type and operations
  * Procedures and subprocedures
  * Built-In Functions (BIFs)
  * Free format RPG specifications with support for free-form SQL statements


## Chapter 03 - Understanding the RPG Fixed Logic Cycle
 Using the fixed logic cycle essentially turns your code into a huge INPUT > PROCESS > OUTPUT cycle.

**Steps of the RPG Fixed Logic Cycle:**
1. Start
2. Write heading and detail lines
3. Get input record
4. Perform total calculations
5. Write total output
6. If **LR (Last Record) indicator** is not on
    * Move fields
    * Perform detail calculations
    * Return to Start
7. Else
    * End of Program 

**Matching Records**
  * Given file1- master payroll records
  * Given file2- time cards
  * Both files have a field called EMPNO (employee number)
  * The program should read employee 1 from the master payroll and then employee 1's timecard from file2. Then, it can perform calculations, etc.
  * A **designator (M1-M9)** can be placed on field names of multiple files to designate the matching fields.
  * Adding to the payroll example, EMPNO would be marked in both files of the RPG program input specs with the M1 designator.
  * Then, RPG makes sure both files are in sequence by EMPNO and when a match is found, the **MR (Matching Record) indicator** is turned on

**Indicators**
  * RPG provides 99 indications to use. The indication can be stored to a special type of field known as an **indicator**.
  * Indicators can be assigned to records in files.
  * If the payroll file gets spec to turn on indicator 01 and the time card gets spec to turn on indicator 02, when payroll file is read only indicator 01 will be on. Only one record identifying indicator can be on at a time since RPG only processes one record every cycle.


# Chapter 04 - Developing RPG Applications
* **Program Development Manager** (PDM) - Released with AS/400 since 1988.
* PDM Features:
  * **Source Entry Utility** (SEU) - Development with programs, display files (screens), and data base objects (files).
## Libraries, Files, Objects
* IBM i/OS manages objects through a directory structure known as a **library**.
* Objects like files, output queues, and programs are "stored" in libraries.
* Like a directory, nothing is stored "inside", the library is a means of locating objects.
* A **source file** is used with IBM i/OS and PDM to store source programs. A source file can contain many source members. 
* A **source program** is a program before it is compiled and translated into machine code.
* The structure of a file in IbM i/OS permits **members** (individual files with the same shape as the major file definition) to live inside of a file structure.
* A source file then is a normal IBM i/OS database file shaped so that it is natural for storing source.
* Each source program that is written in RPG/400 is stored in a sub-object (member), which is a component of a file which is stored in a library.
* So, PDM is a "list manager" for working with lists of libraries, objects in files, and members. It can also create objects and run programs on the system.


### PDM
* I'll try my best to take notes here, but its really just a lot of screwing around in the green screens.
* Eventually, I might make a "cheat sheet" for important notes and "gotchas"
* Enter PDM ```[5] - [2]```
* Change current library to my library ```CHGCURLIB BOLIB```
* Display library list ```DSPLIBL```
* Display my library ```DSPLIB BOLIB```
* Work with my library's objects ```WRKLIB BOLIB``` 
* Work with my library using PDM ```WRKLIBPDM BOLIB```
* ```F4=Prompt``` --- Very useful for finding commands

### Line Commands
Record and line has been used interchangably so... ?
* C - Tell SEU which line to copy
* C n - Copy n records starting at current record
* A - Paste copied line after
* A n - Paste n lines after specified line
* B - Paste copied line before
* B n - Paste n lines before specified line
* O - Paste copied line overtop
* I - insert line
* I n - Insert n lines
* D - delete line
* CC - Set a block of code to copy
* DD - Delete a block of code
* CR - Copy Repeat
* M - Move line
* MM - Move block of code
All line commands follow the same pattern, I did not list all of them. So obviously there is CCR, CR n , DD n, etc.

# Chapter 05 - Your First RPG Program
