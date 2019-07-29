# Mastering-IBMi

Mastering IBMi Jim Buck and Jerry Fottral


## Chapter 1 - Communicating with the System
* **Job** - A unit of work; includes all programs, files, and instructions needed to perform work.
* **Object** - Anything on the system that has a name and takes up space in storage.
* **Object Type** - Determines object use case on system. (programs, files, commands, etc.)
* **Subsystem** - All jobs are run in subsystems; dedicated resources/area to execute jobs
  * **QCTL** - Controlling subsystem
  * **QINTER** - Interactive subsystem
  * **QBATCH** - Batch subsystem
* **Job Types**
  * Interactive - Start when user signs in, ends when user signs off. (needs user intervention)
  * Batch - Jobs that execute without user intervention. These are sent to job queue until they start.
* **Job Queue** - Batch jobs are sent here and wait to be executed (typical queue behavior). Each subsystem has a limit on concurrent batch job execution.
* **Control Language (CL)**
  * (think of shell/batch for linux/windows, but better)
  * Consistent user interface to various functions in IBMi OS.
  * Over 2000 individual CL commands
  * Can be grouped into a CL program or called from a high level language such as RPG, COBOL, or C++ 
* **System values** - configuration of OS functions, job behavior, etc.
  * Allocation **\*ALC** - number of active jobs and main storage needed for running jobs.
  * Date and Time **\*DATTIM** - System date/time
  * Editing **\*EDT** - Dates, decimals, and numbers involving currency formatting
  * Library Lists **\*LIBL** - Specify order of objects contained within system libraries and user-created libraries
  * Message and logging **\*MSG** - Message recording and handling
  * Security **\*SEC** - Security information. EX: invalid sign-on attempts
  * Storage **\*STG** - Number of active jobs and minimum size of base storage pool.
  * System **\*SYSCTL** - Access to "boot level" values for IBMi OS (IPL, initial program load)
* **Library** - Directory of objects (Schema)
* Programming languages
  * Past: BASIC, FORTRAN, Pascal, PL/I.
  * Current: ILE RPG(RPGIV), C, C++, COBOL, and Java.
  * SQL is also available with DB2 query.
  * Most recently, there were a number of more modern language popping up on the IBMi such as PHP, Node.js, and Python.
* **User Profile**
  * 10 characters long
  * Identifies user, specifies authorities, and contains user specific configurations for various things.
  * user class - programmer, operator, etc.
  * special authorities - create/edit user profiles, job control, etc.
  * initial program - starting program when user signs on
  * initial menu - starting menu when user signs on
  * current library - first library to start looking for objects
  * job description - job related properties; job queue to use, library list, scheduling, etc.
  * group profile - group the user belongs to, giving specific authorities or restrictions.
  * status - user is enabled or disabled
  * output queue - where the user's printer output goes
* **Menu screens**
  * Four primary sections
    * screen header - menu ID (upper left; AKA menu object name), menu description (upper center), system name (upper right)
    * Menu options - "taking a 14 on X"
    * Command line specified by ===>
    * Active function keys F1-F24


## Chapter 2 - Using CL
* CL syntax - ```CMD PARAM PARAM``` EX: ```CRTLIB HELLO *TEST```
* Generally, most CL commands follow a three character naming scheme 
  * C - C programming language
  * CBL - COBOL programming language
  * CL - Control language
  * DFU - Data file utility
  * RPG - Report Program Generator (RPG) programming language
  * SEU - Source entry utility
  * CRT - Create a program EX: CRTBNDRPG
* Library List
  * System (up to 15) EX: QSYS, QHLPSYS, QUSRSYS
  * Product (none, 1, or 2) EX: QPDA, QRPG
  * Current (only 1) EX: BOLIB (personal)
  * User (up to 250) EX: QTEMP, MYLIB1
* **System Libraries**
  * QSYS - essential system objects
  * QSYS2 - Additional system programs and files
  * QHLPSYS - Help information
  * QUSRSYS - Other critical objects for various system functions


## Chapter 3 - Objects
* Almost every named entity on the IBMi is an object
  * libraries, source files, database files, commands, etc.
* Hardware devices are not objects, so device descriptions are used as the interface object
  * display devices, printers, tape drives, diskette units
* **IBMi OS Layered Machine Architecture**
  * IBMi operating system
  * Technology Independent Machine Interface (TIMI)
  * System Licensed Internal Code (SLIC)
  * Power hypervisor
  * 64-bit RISC hardware

A request is passed through the machine interface which converts into system licensed code before interacting with hardware. This allows the logical machine (applications, programs, etc.) to not be dependent on the physical machine.
The IBMi was able to undertake an upgrade from 48-bit CISC processors to 64-bit RISC processors without programmers needing to rewrite their programs. Even though physically the machine was almost entirely different. The POWER hypervisor allows different OSs such as IBMi, AIX, linux to run on different partitions of the server.

All objects are organized by **object type** determined by the OS upon running commands such as ```CRTUSRPRF```. This creates an object with type *USRPRF. An object is always placed in a library, a virtual collection of objects (kind of like a folder, but not really).

When requesting an object by name (**simple object name**), the OS looks for the object in each library in the user's library list from top to bottom. The most direct way to call an object is using its **qualified name**. This contains the library reference and the object name ```BOLIB/HELLO```. The system will only search BOLIB for the object.

#### Basic Library list commands
* ```DSPLIBL``` - display library list
* ```CHGCURLIB``` - change current library
* ```ADDLIBLE``` - add a library to library list
* ```CHGLIBL``` - change the library list (add, remove, etc)
* ```EDTLIBL``` - edit library list (no need to reorder or retype library names)


#### Batch work management
* Job Queue
  * job is submitted as a batch job by user
  * system places this job in batch job queue
* SubSystem
  * Job is scheduled into correct batch subsystem
  * As program runs it opens a spool file in assigned output queue
* Output Queue
  * Spool file sits in output queue unless it is assigned to a printer
  * If print writer for out queue is started, the job prints when printer is idle


#### Print Spooling
Subsystem **QSPL** handles print spooling. It manages each printed report called a **spool file**. This spool file is created by the job before the report goes to an actual printing device.

To print output, the program must write output data to a **printer file**. A printer file is a type of device file that holds attributes about what the printed output should have (formatting, page size, etc).


#### Printing Process
* Application, Program
* Printer File
* Output Queue -> Spool file
* Printer Writer


## Chapter 4 - Handling Spooled Files
* ```WRKOUTQ``` work with output queue; lists all spooled files in an output queue regardless of who created them
* ```WRKSPLF``` work with spooled files; list all spool files create by a user regardless of output queue
* ```CLROUTQ``` clear output queue; clear all print files from an output queue

This chapter had a lot of screen information so it doesn't translate well to written notes.