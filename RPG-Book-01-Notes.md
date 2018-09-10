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
