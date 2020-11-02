Prerequisite to making the Robot Framework running in Pycharm

Install Robot Framework in Pycharm:

With the following steps you can install Robot Framework in Pycharm

Step 1: Download & Install Python or Miniconda3 

Step 2: Download Web drivers and move to Bin Folder under local C:\
•	ChromeDriver
•	FirefoxDriver
•	EdgeDriver
•	InternetExplorerDriver
•	OperaDriver
•	SafariDriver

Step 3: Download & Install Pycharm 

Step 4: Set Python in the Environment Variables 
       Setting PATH on Windows
Open Control Panel > System > Advanced > Environment Variables. There are User variables and System variables, and the difference between them is that user variables affect only the current users, whereas system variables affect all users.
Exit the dialog with Ok to save the changes.
      Setting PATH on UNIX-like systems
On UNIX-like systems you typically need to edit either some system wide or user specific configuration file. Which file to edit and how depends on the system, and you need to consult your operating system documentation for more details

Step 5: Install Robot Framework, Selenium and Selenium2Library
    – pip install robotframework-selenium2library

Step 6: Open Pycharm

Step 7: Install the Plugins
    – File -> Settings -> PlugIns
    – Browse Repositories -> Search Intellibot, Robot Framework Support
    – Install the Plugins “Intellibot, Robot Framework Support” & restart Pycharm

Step 8: Create a Robot File

Step 9: Start Robot Framework Test
    – pybot robotfilename

Detailed manual Setup of Robot Framework is also described in below link
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

Executing Testcases:

In Your Project directory run ‘python -m robot -d Results Tests’ in Miniconda 3 in order to run the execute the cases

Note: In case of executing with specific Tags, run 'python -m robot -i <any tag name in Tests> -d Results Tests'

Report:

Execution results will get stored in Results folder as below forms.
•	Log.html
•	Output.xml
•	Report.html