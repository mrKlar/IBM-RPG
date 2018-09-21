# The AS/400 & IBMi RPG & RPGIV Developer's Guide
My attempt at recording useful notes from the following textbook: <br>
[The AS/400 & IBMi RPG & RPGIV Developer's Guide by Brian W. Kelly](https://www.amazon.com/gp/product/0998268313/ref=oh_aui_search_detailpage?ie=UTF8&psc=1)


## Introduction to the RPG Language
* **RPG** - Report Program Generator
  * IBM - 1959
  * Original Purpose: Generation of reports from data files.
  * Originally designed for punch card machines.
  * Business application programming language for small to medium sized businesses.


## The History of the RPG Language
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


## RPG Fixed Logic Cycle
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


# Program Development Manager
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
* ```C``` - Tell SEU which line to copy
* ```C n``` - Copy n records starting at current record
* ```A``` - Paste copied line after
* ```A n``` - Paste n lines after specified line
* ```B``` - Paste copied line before
* ```B n```- Paste n lines before specified line
* ```O``` - Paste copied line overtop
* ```I``` - insert line
* ```I n``` - Insert n lines
* ```D``` - delete line
* ```CC``` - Set a block of code to copy
* ```DD``` - Delete a block of code
* ```CR``` - Copy Repeat
* ```M``` - Move line
* ```MM``` - Move block of code
All line commands follow the same pattern, I did not list all of them. So obviously there is CCR, CR n , DD n, etc.

# Mixed Notes
* **Spooled file** - "printed output" in the sense that they are formatted and ready to print, but have not yet.
* **System spooler**, QSPL, is a specialized part of the OS. It stages and controls batch jobs before they begin execution, and it manages each printed report (spooled file) created by ajob before the report goes to an actual printer device.
  * Controls incoming batch jobs
  * Places them in job queue until execution can begin
  * Printed output
  * Place in output queue until writer is available
  * Finally print
* **Printer File** - A type of device file that determines the attributes the printed output will have. Defines the formatting, page size, special printing features, and specify an output queue.

# Commands
* Show installed licensed programs ```GO LICPGM - [10]```
* Return to main menu ```GO MAIN```
* Change Profile ```CHGPRF```
* Change User Profile ```CHGUSRPRF```
* Display Library List ```DSPLIBL```
* Change Current Libary ```CHGLIBL```
* Call Program in Specified Libary ```CALL SOMELIB/SOMEPGM```
* Create RPG Program ```CRTRPGPGM```


# Common AS/400 Object Types
| **Object Type** | **Object Description** | **Attribute(subtype)**          |
| --------------- | ---------------------- | ------------------------------- |
| *AUTL           | Authorization List     |                                 |
| *CMD            | Command                |                                 |
| *DEVD           | Device Description     |                                 |
| *FILE           | File                   | PF (Physical File)              |
| *FILE           | File                   | LF (Logical File)               |
| *FILE           | File                   | DSPF (Display File)             |
| *FILE           | File                   | PRTF (Printer File)             |
| *JOBD           | Job description        |                                 |
| *LIB            | Library                |                                 |
| *OUTQ           | Output Queue           |                                 |
| *PGM            | Program (executable)   | Source Language (CBL, RPG, etc) |
| *QRYDFN         | Query Definition       |                                 |
| *USRPRF         | User Profile           |                                 |

* **Output Queue** An object containing a list of spooled files(printed reports) that can be displayed on a workstation or write to a printer device.



# Using Control Language (CL)

## CL Verbs
| **CL Verb** | **Name**   | **Example** | **Description**            |
| ----------- | ---------- | ----------- | -------------------------- |
| CALL        | Call       | CALL        | Executes a program         |
| CLR         | Clear      | CLROUTQ     | Clear Output Queue         |
| CPY         | Copy       | CPYF        | Copy File                  |
| CRT         | Create     | CRTCBLPGM   | Create Cobol Program       |
| DLT         | Delete     | DLTUSRPRF   | Delete User Profile        |
| DSP         | Display    | DSPMSG      | Display Messages           |
| EDT         | Edit       | EDTOBJAUT   | Edit Object Authority      |
| GRT         | Grant      | GRTUSRAUT   | Grant User Authority       |
| INZ         | Initialize | INZTAP      | Initialize Tape            |
| OPN         | Open       | OPNQRYF     | Open Query File            |
| RCL         | Reclaim    | RCLSPLSTG   | Reclaim Spool Storage      |
| RCV         | Receive    | RCVNETF     | Receive Network File       |
| RLS         | Release    | RLSSPLF     | Release Spooled File       |
| RMV         | Remove     | RMVLIBLE    | Remove Libary List Entry   |
| RST         | Restore    | RSTLICPGM   | Restore Licensed Program   |
| RTV         | Retrieve   | RTVSYSVAL   | Retrieve System Value      |
| SAV         | Save       | SAVCHGOBJ   | Save Changed Object        |
| SBM         | Submit     | SBMJOB      | Submit Job                 |
| SND         | Send       | SNDMSG      | Send Message               | 
| STR         | Start      | STRSEU      | Start Source Entry Utility |
| WRK         | Work With  | WRKSYSSTS   | Work With System Status    |

* CALL - Used to execute a program
* GO - Used to display a menu


## Specification Overview
When present, forms are always presented to the RPG Compiler in the following sequence:

* **H** Header (control) Specification Form
* **F** File Description Specification Form
* **I** Input Specification Form
* **D** Definition Specification - RPGIV only
* **C** Calculation Specification Form
* **O** Output Specification Form
* **E** File Extension Specification Form (After F)
* **L** Line Counter Specification (After E or F if no E)
* **P** Subprocedure Specification Form - RPGIV Only

## Header(control) Specification Form
Provides RPG/400 compiler with information about your program and system including:
* Name of program
* Date format to use
* Alternative collating sequence or file translation (if used)
* Debug mode (1 in column 15)

### Header Spec Columns
Won't go into too much detail, will probably never reference this anyway.
| **Columns** | **Description**              | **Notes**                                |
| ----------- | -----------------------------| ---------------------------------------- |
| 7-14        | Reserved                     |                                          |
| 15          | Debug                        | Place a 1 in column 15 to activate debug |
| 16-17       | Reserved                     |                                          |
| 18          | Currency Symbol              | Any character except 0*,'.&-CR           |
| 19          | Date Format                  | See below                                |
| 20          | Date Edit                    | Separator character / . -                |
| 21          | Decimal Notation             | Separator for numerical literals         |
| 22-25       | Reserved                     |                                          |
| 26          | Alternate Collating Sequence | Blank=normal, S=Alternating              |
| 27-39       | Reserved                     |                                          |
| 40          | Sign Handling                | Must be blank                            |
| 41          | Forms Alignment              | Blank=first line printed once, 1=        |
| 42          | Reserved                     |                                          |
| 43          | File Translation             | Blank=no translation, F=File translation |
| 44-56       | Reserved                     |                                          |
| 57          | Transparency Check           | Blank=No check, 1=check                  |
| 58-74       | Reserved                     |                                          |
| 76-80       | Program Identification       | optional, 6 characters max if set here   |

### H Column 19 Date Format
| **Character** | **Description**                                                         |
| ------------- | ----------------------------------------------------------------------- |
| Blank         | month/day/year if col 21 is blank. day/month/year if col 21 is D,I,or J |
| M             | Month/day/year                                                          |
| D             | Day/month/year                                                          |
| Y             | Year/month/day                                                          |

## RPGIV Header Specification
Methods:
* A control specification included in source with H in column 6
* A data area named RPGLEHSPEC in *LIBL
* A data area named DFTLEHSPEC in QRPGLE