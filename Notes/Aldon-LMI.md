# Aldon-LMI


Brief notes on how to use Rocket Aldon Lifecycle Manager (LMI).
LMI is kind of like git for the IBMi (Not really, but its the closest comparable thing I can think of).
It manages changes, application releases, deployments, and task management.


## Basics
* Start LMI ```STRLMI```
* Work with objects by release - **1**
  * Create an object tracked with LMI - ```F6```
* Work with objects by developer - **2**
  * options (most used)
    * **2** - edit
    * **7** - promote (to next environment)
    * **5** - browse source
    * **8** - display attributes
    * **12** - work with conflicts (kind of like git merge conflicts but not really)
    * **25** - retire object
    * **30** - display log (show object history)
* Display log **7** (kind of like git commit history)


## Environments - Envs
* D - Development
* I - Integration
* Q - Quality Assurance (QA)
* P - Production
* \* - Retired Object


## Working with and promoting an object
* Navigate to JIRA ticket (ex: XYZ-123), click 'CreateLMi' link (JIRA+LMi integration), and finish prompt.
* Login to IBMi, ```STRLMI```, and take option 1 (Work with objects by release).
* Select object, take option 3 (check out to DEV), and fill in task (XYZ-123).
* Make changes, save, and compile(create) with option 14
* Promote object using option 7 (moves from ITG to DEV)
* Test calling the object in the new environment
* Very similar process for moving from DEV to QA to PROD
