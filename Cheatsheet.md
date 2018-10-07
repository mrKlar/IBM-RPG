# Cheatsheet
The long sets of notes are great and all, but sometimes its easier to just glance at a condensed cheatsheet.


## RPG Statements Summary
| **Statement**  | **Spec** | **Description**                                         |
| -------------- | -------- | ------------------------------------------------------- |
| Control/Header | H spec   | General purpose keywords that affect the entire module. |
| File           | F spec   | Define files to be used in module.                      |
| Definition     | D spec   | Define constants, variables, and prototypes.            |
| Input          | I spec   | Define input record layouts for your files.             |
| Calculation    | C spec   | Location of code for logic of procedures.               |
| Output         | O spec   | Define output record layours for your files.            |
| Procedure      | P spec   | Start and end subprocedures                             |


## Basic CL Commands
* Display library list ```DSPLIBL```
* Change current library to my library ```CHGCURLIB BOLIB```
* Display my library ```DSPLIB BOLIB```
* Work with my library using PDM ```WRKLIBPDM BOLIB```
* Call HELLORPG Compiled Object ```CALL BOLIB/HELLORPG```


## RPGLE Free Format Random Notes:
* ```RETURN``` or ```*inlr = '1';``` Stop the RPG cycle 
* ```QUALIFIED``` - subfields of data structure must be qualified by data structure name. EX: ds.subfield
* ```LIKEDS``` - Define data structure with same subfields as parent data structures, auto qualified.
* ```INZ(*LIKEDS)``` - Init LIKEDS data structure the same as the parent.
* ```%char(num)``` - Convert numeric value to string 
* ```%len(string)``` - Return current length of variable
* **EXTPGM** keyword is case sensitive