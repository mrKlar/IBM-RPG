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


# Specification Overview
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

# Header(control) Specification Form
Provides RPG/400 compiler with information about your program and system including:
* Name of program
* Date format to use
* Alternative collating sequence or file translation (if used)
* Debug mode (1 in column 15)

### Header Spec Columns
Won't go into too much detail, will probably never reference this anyway.

| **Columns** | **Description**              | **Notes**                                |
| ----------- | ---------------------------- | ---------------------------------------- |
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

### RPGIV Header Specification
Methods:
* A control specification included in source with H in column 6
* A data area named RPGLEHSPEC in *LIBL
* A data area named DFTLEHSPEC in QRPGLE



# File Description and Line Counter

File description specifications describe all the files a program uses. For each file, the following information will be specified:
* Name of file
* How the file is used
* Size of records in file
* Input or output device used for the file
* If the file is conditioned by an external indicator

Internally described data
```
F*
F*  RPG FILE DESCRIPTION SPECIFICATION FORMS
F*
FEMPMAST IPEAE                    DISK
FTIMCRD  ISEAE                    DISK
FQPRINT  O   F      77     OF     PRINTER
```

## File Description Specfications
| **Cols RPG, Cols RPGIV** | **Description** | **Notes**                                |
| ------------ | -----------------------------| ---------------------------------------- |
| 7-14, 7-16   | File Name                    | Unique, 1-8 chars starts w/letter. RPGIV 10 chars |
| 15, 17       | File Type                    | I=Input, O=Output, U=Update, C=Combined(I/O) |
| 16, 18       | File Designation             | Notes below                              |
| 17, 19       | End of File                  | E=All records must be processed before EOF, Blank=Does not have to be fully processed |
| 18, 21       | Sequence                     | A=Match fields Ascending, Blank=A, D=Match fields Descending |
| 19, 22       | File Format                  | F=Program described, E=Externally Described |
| 20-23        | Reserved                     | Must be blank                            |
| 24-27,23-27  | Record Length                | Length of LFs in program described files |
| 28-39        | Other Entries ?              | ?                                        |
| 28, 28       | Limits Processing            | L=Sequential-within-limits processing by record-address file, Blank=Sequential or random processing |
| 29-30, 29-33 | Length of Key or Record Address | Used for program described keyed database file | 
| 31, 34       | Record Address File Type     | Notes Below                              | 
| 32, 35       | File Organization            | Blank=without keys (external), I=Index file (program-described), T=Record address file - relative-record numbers (program-described) |
| 33-34        | Overflow Indicator           | Blank=None, OA-OG OV= , 01-99=           |
| 35-38        | Key Field Starting Location  | Internally described only. Blank=none, 1-9999=Record position in program described index file. |
| 39           | Extension Code               | Hold more file description data. Blank=none, E=Extension specs further describe, L=Line counter spec further describes |
| 40-46, 37-42 | Device                       | PRINTER, DISK, WORKSTN, SPECIAL |
| 47-52        | Reserved                     | Must be blank                   |
| 53           | Continuation Lines           | K = continuation                |
| 54-59        | Routine                      | For SPECIAL Device              |
| 60-65        | Reserved                     | Must be blank                   |
| 66           | File Addition                | A=Records will be added, Blank=None |
| 67-70        | Reserved                     | Must be blank                   |
| 71-72        | File Condition               | External program switch. Blank=if input>open, U1-U8(User)=File is used only when indicator is on, UC=Programer controlled first open of file |
| 73-74        | Reserved                     | Must be blank                   |
| 75-80        | Comments                     |                                 |

### File Designation Types
| **Letter** | **Name**             | **Description**                          |
| ---------- | -------------------- | -----------------------------------------|
| Blank      | Output File          |                                          |
| P          | Primary File         |                                          |
| S          | Secondary File       |                                          |
| R          | Record Address File  | Sequentially organized file for selecting records from another file. Logical files have mostly replaced their usefulness. |
| T          | Array or Table File  | Small files often used for codes.        |            
| F          | Full Procedural File | Gives the programmer full procedural control of the program. |

### Record Address File Types
| **Letter** | **Description**                                                 |
| ---------- | --------------------------------------------------------------- |
| Blank      | Relative record numbers, consecutive read, all keys same format |
| A          | Character keys - valid only for program-described files specified as indexed files or record-address-limits file |
| P          | Packed keys - valid only for program-described files specified as indexed files or record-address-limits file |
| K          | Key values are used to process the file. Only for externally described files. |

### FC File Description Continuation Lines
There is a huge table starting on Page 97, I am not copying it over


## RPGIV File Descripton Keywords
| **Keyword/Sample**          | **Other Options**   | **Description*                  |
| --------------------------- | ------------------- | ------------------------------- |
| BLOCK(*YES)                 | *NO                 | Should records from this file be processed in a block? |
| COMMIT(YESORNO)             | RPG_NAME            | Enable commit with a "1" value |
| DATFMT(*ISO)                | Format{separator}   | Specifies date format          |
| DEVID(devname)              | Field name          | Name for device supplying the last record processed |
| EXTFILE(BOLIB/HELRPG)       | Filename; libname/filename | Specify external file name |
| EXTIND(*INU1)               | (*INUx)             | Open file f ext. indicator on |
| EXTMBR(MEMBER2)             | *First; *All, member name | Specify member name in file to open |
| FORMLEN(50)                 | number              | Specify form length in lines for line counter function |
| FORMOFL(44)                 | number              | Specify line # which turns overflow indicator on |
| IGNORE(RFMT01:RFMT02)       | (recformat{:recformat...}) | Ignore one or many record formats from this file |
| INCLUDE(RFMT01:RFMT02)      | (recformat{:recformat...}) | Include one or many record formats from this file |
| INDDS(INDICATORS)           | DS_Name             | Load workstation indicators into this structure during execution |
| INFDS(FEEDBACK)             | DS_Name             | Name the info DS that will be associated with this file |
| INFSR(SUBNAME)              | *PSSR;(SUBRname)    | Name subroutine to get control if error |
| KEYLOC(45)                  | Number              | Specify location of key in program described file |
| MAXDEV(*ONLY)               | *FILE               | Restricts # of acquired devices such as workstations |
| OFLIND(OF)                  | OA-OF, OF           | Specify overflow indicator for a printer device file |
| PASS(*NOIND)                |                     | Do programmers control indicator passage? |
| PGMNAME(SPECDEV)            | program_name        | Provide name of program to handle special device |
| PLIST(BIGPARMS)             | (Plist_name)        | Provide name for paramter list to be used with called or calling programs |
| PREFIX('GRP1.')             | (prefix{:nbr_of_char_replaced}) | Prefix appended to beginning of each field in file to avoid dup names when used with other files |
| PRTCTL(FRMCTLDS)            | (data_struct{:*COMPAT}) | Provide name of forms control data structure | 
| RAFDATA(RAFFILE)            | Filename            | Specify the name of RAFFILE to control record processing for this file |
| RECNO(RRN)                  | (Fieldname)         | Specify field name to contain the record # to write output records to a direct file |
| RENAME(FM1:FM2)             | (Ext_format:Int_format) | Rename external record format for program use to avoud conflicts |
| SAVEDS(SAVEFIELDS)          | DS Name              | Provide a DS name so that RPG will save fields for each device before each input operation |
| SAVEIND(55)                 | number               | Simlar to SAVEDS, specify how many indicators you want to be saved |
| SFILE(SFL3:RRN3)           | (recformat:rrnfield)  | Specify name of subfile format and field name to be used for subfile record processing. |
| SLN(15)                    | Number (1 to 24)      | Starting line # to place record formats for this workstn file. At least one screen panel must use SLNO(*VAR) |
| TIMFMT(*ISO)               | format{separator}     | Specify time format |
| USROPN                     |                       | This file will bbe opened in the program - RPG will not auto open it |


# Input
To save typing time, only Externally Described Records will be mentioned. For Program Described Records, see Page 113

## Externally Described Record ID Entries
|**RPG Cols, RPGIV Cols** | **Description**              | **Notes**                                                      |
| ----------------------- | -----------------------------| ---------------------------------------------------------------|
| 8-14, 7-16              | Record Name                  | External name of record format - file name cannot be used or an externally described file |
| 16-18                   | Reserved                     | Must be blank                                                  |
| 19-20, 21-22            | Record Identifying Indicator | Optional; Turned on if record format name in 8-14 is read by program |
| 21-41                   | Unused                       | Must be blank                                                  |
| 42-74                   | Reserved                     | Must be blank                                                  |
| 75-80                   | Reserved                     | Comments or left blank                                         |

## Externally Described Field Description Entries
|**RPG Cols, RPGIV Cols** | **Description**              | **Notes**                                                          |
| ----------------------- | ---------------------------- | ------------------------------------------------------------------ |
| 7-20                    | Reserved                     |                                                                    |
| 21-30, 21-30            | External Field Name          | Rename the field                                                   |
| 31-52                   | Reserved                     |                                                                    |
| 53-58, 49-62            | Field Name                   | Name of field as defined in external record description(<=6); Name to be used in program that replaced external name specified in 21-30 |
| 59-60, 63-64            | Control Level                | Blank=not a control field, L1-L9=is a control field                |
| 60-61, 65-66            | Match Fields                 | Blank=not a match field, M1-M9=Is a match field. More notes Pg 114 |
| 63-64                   | Reserved                     |                                                                    |
| 65-70, 69-74            | Field Indicators             | Blank=no indicator, 01-99=General indicators for programmer use, H1-H9=Halt indicators
(cause machine to halt), U1-U8=External indicators (externally supplied), RT=Return indicator (causes return to calling program) |
| 71-74                   | Reserved                     |                                                                    |
| 75-80                   | Comments                     | Comments                                                           |

## Program Described Record ID Entries
Pages 115-125


## Input Structures and Constants
Pages 127-135


# Calculations
* Column 6 - C Spec
* A Calculation form consists of three areas:
 * The conditions under which the calculations are to be done
 * The entries for the calculations
 * The type of tests that are to be made on the results of the operation HI,LO,EQ


|**RPG Cols, RPGIV Cols** | **Description**                  | **Notes**                                                         |
| ----------------------- | -------------------------------- | ------------------------------------------------------------------|
| 7-8                     | Control Level                    | See Below                                                         |
| 10-17, ?                | Indicators                       | x > y = (+,HI,>) , x < y = (-,LO,<) , x==y = (0,EQ,=)             |
| 18-52                   | Factors and Operators            | See Below                                                         |

### C Columns 7-8 Control Level
|**Value** | **Description**                        |
| -------- | ---------------------------------------|
| Blank    | A: Operation is performed at detail calculation time for each program if conditions are met, B: Operation is performed within a subroutine. |
| L0       | Operation is done at total calculation time for each program-cycle independent of control fields.                    |
| L1-L9    | Operation is done when the appropriate control break occurs at total calculation time, or when the indicator is set on. |
| LR       | Operation is done after last record has been processed or after LR indicator has been set on. |
| SR       | Calculation operation is part of an RPG/400 subroutine. A blank entry is also valid for subroutines. |
| AN, OR   | And and Or indicators are used to group calculations to have more than one line condition the calculation. |

### C Columns 18-52 Factors and Operators
|**Function**                 | **RPG/400** | **RPGIV**       |
| --------------------------- | ----------- | --------------- |
| Factor 1                    | 18-27       | 12-25           |
| Operation(plus op extender) | 28-32(none) | 26-35(extender) |
| Factor 2                    | 33-42       | 36-49           |
| Extended Factor 2           | N/A         | 36-80           |
| Result Field                | 43-48       | 50-63           |
| Length                      | 49-51       | 64-68           |
| Decimal Places              | 52          | 69-70           |
| Operation Extender          | 53          | N/A (26-35)     |

