# DATA 530 Lab 1

We will be using a variety of tools that will require some initial configuration. To ensure everything goes smoothly moving forward, we will setup the majority of those tools in this tutorial. 

## Setting up iClicker
We will use iClicker for in class exercises. These exercises make up 10% of your overall grade. Click [here](https://lthub.ubc.ca/guides/iclicker-cloud-student-guide/) to set up iClicker. The name of the course to add is **Data 530-2023**.

## Github online

First of all, you should have been able to access this lab! You did it through the web interface of Github. For a refresher of how it works, until you have master the command line interface, refer to this: [Github guide](https://help.github.com/articles/github-flow/)

## Installing the Data Science Software Stack
- Follow the instructions in this document to install the Data Science Software Stack you will need for the MDS program.
- To submit your homework, submit using Git screenshots demonstrating you successfully installed each of these programs (*i.e.,* screen shot of a running instance of Jupyter Notebook to prove you correctly installed it). There should be 5 screenshots to be included in your homework submission. We have made it clear what you need to take a screenshot of for each program you installed by bolding these instructions. Each screenshot is worth 2 marks.
- Ensure you label each screenshot correctly. If we have to guess what program it is, you will not receive the marks.
- You can submit individual screenshots with appropriate file names or a document containing the screenshots as either PDF, Jupyter Notebook, or Markdown.

## Table of Contents
- [Installing git](#Installing-git)
- [Getting and Installing Python & Jupyter](#getting-and-installing-python)
- [Installing R and RStudio](#installing-r-and-rstudio)
- [Installing a Text Editor](#installing-a-text-editor)
- [Installing Microsoft Excel](#installing-microsoft-excel)
- [Submitting Via GitHub Classroom](#submitting-via-github-classroom)
- [Useful Terminal Commands](#three-useful-terminal-commands)
- [Documentation](#documentation)
- [Troubleshooting](#troubleshooting)

## Installing git

We will be using the command line version of git.


#### Mac Users
Open Terminal and run the command:
```$ xcode-select --install```
This will install git and many other very useful applications as well.


#### Ubuntu Users
On Ubuntu, open the terminal and install git using your system package manager (yum, apt-get, etc):

```
$ sudo apt-get install git
```


#### Windows Users
Go to https://git-scm.com/downloads. Click on Windows download link,and accept all defaults in the installation process. Note that when selecting the default editor during the install, you may want to select Notepad++, if you are a Windows user and prefer to use Notepad++ over Atom. See the Installing a Text Editor section for more details. Installing git will also install for you a minimal unix environment with a "bash" shell and terminal window. Voila, your Windows computer is transformed into a unixy form.

#### Testing git installation

Mac/Linux Users need to open Terminal and Windows users should open Git Bash.

Mac Users can go to Applications --> Utilities folder, and then open Terminal.

Linux Users should open Terminal from their desktop side bar or by pressing ``` ctrl + alt + t ```

Windows users can open Git Bash by searching for it from their start menu.

Run ``` git --version ```(on terminal if on Mac/Linux, on Git Bash if on Windows). If you are returned the version of git, it means your install was successful!

![Git](https://i.imgur.com/Dx5DfHd.png)

**Take a screenshot of the successful output of `git --version` to "prove" you correctly installed Git**

## Getting and Installing Python

We will be using Python for a large part of the program, including many popular 3rd party Python libraries for scientific computing. [__Anaconda__](https://docs.anaconda.com/anaconda/) is an easy-to-install bundle of Python and most of these libraries. We __strongly recommend__ that you use Anaconda for this program. If you insist on using your own Python setup instead of Anaconda, we will not be able to provide the same level of support with installation.

For this program we are using __Python 3__ , not __Python 2__, so please choose the Anaconda versions that include Python 3.7.

#### Mac/Linux Users

1. Head to https://www.anaconda.com/download/ and download the Anaconda version for Mac OS or Linux with Python 3.7.
2. Follow the instructions at https://docs.anaconda.com/anaconda/install to install Anaconda. Note, this may take some time to install all dependencies.
3. (Optional) Run ```export PATH=/home/<username>/anaconda3/bin:$PATH``` after the install to add Anaconda to your path variables. This allows you to run Jupyter from the command line.

If you already have installed Anaconda at some point in the past, you can easily update to the latest Anaconda version by updating conda, then Anaconda in terminal as follows:
```
    conda update conda
    conda update anaconda
```


3. Test out the Jupyter notebook: Use the Anaconda Launcher which should be available on your desktop or in your apps. If you Anaconda to your path variables, you can also run Jupyter Notebook by entering ```jupyter notebook``` into your Terminal.



#### Windows Users

1. Head to https://www.anaconda.com/download/ and download the Anaconda version with Python 3.7.
2. Follow the instructions on that page to run the installer.
3. Test out the Jupyter notebook: open Git Bash, and type ```jupyter notebook```. Or use the Anaconda Launcher which might have been deposited on your desktop. A new browser window should pop up. Note that a command line window will open up and there will be a short loading time before Jupyter opens in your browser.

	(Optional) In order to open Jupyter notebook through Git Bash its location needs to be added into the PATH Enviroment Variable.
	Follow the steps below (applies to Windows 10):
	1. Open System by navigating to This PC, right click and select properties (or open it directly from the Control Panel).
	2. Select Advanced system settings and then click the Enviroment Variables button.
	3. Highlight the Path variable under `System variables` and select Edit.
	4. On the edit screen, click New and add the directory of your Python installation (e.g. `C:\Users\<username>\Anaconda3`).
	5. Click New and add the directory of your Jupyter installation (for me: `C:\Users\<username>\Anaconda3\Scripts`), then hit `Ok`.
	6. Open Git Bash, and type ```jupyter notebook``` to test it out.


### __Running Jupyter Notebook__

The Jupyter notebook is an application to build interactive computational notebooks.

To create a new notebook go to *New -> Python 3*.

Notebooks are composed of many "cells", which can contain text or code. Create a cell and evaluate the python code by clicking the "play" button above, or by hitting ```Ctrl + enter```

Now go to *Insert -> Insert New Cell Below* and run the following code in this new cell:
```
import numpy
import scipy
import matplotlib

```


numpy, scipy and matplotlib are some of the important libraries that come with Anaconda that we will be using. Now instead of using ```Ctrl + enter ``` to run your code, try ```shift + enter```. Using this, Jupyter will run your code *and* create a new cell automatically. If this code runs successfully, you should have a successful installation of Anaconda


![Git](https://i.imgur.com/J2JZ1O5.png)

**Take a screenshot of the successful opening of a Python kernel in the Jupyter notebook to show you correctly installed Anaconda.**

## Installing R and RStudio
We will be using R, another language, and RStudio (an IDE for R) for  a lot of assignments as well. Both R and Python come with their own [advantages and disadvantages](http://www.kdnuggets.com/2015/05/r-vs-python-data-science.html), but are both used extensively for data science.

#### Mac Users
1. Go [here](https://cran.r-project.org/bin/macosx/) and download the latest version of R for Mac. Open the file.
2. Chose and download the Mac version of RStudio from https://www.rstudio.com/products/rstudio/download/preview/. Open and run the installer.
3. Download XQuartz from [here](https://www.xquartz.org/). Run the ```.dmg``` file.
4. We will also be installing IRKernel to be able run R code inside of Jupyter. Open terminal and type ```R```
5. Now run the following commands:
```
install.packages(c('repr', 'IRdisplay', 'crayon', 'pbdZMQ', 'devtools', 'stringr'), repos="http://cran.stat.sfu.ca/")
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()
```


#### Ubuntu Users

1. Go to ```~etc/apt/``` and click on the ```sources.list``` file. Click on `Other Software'-> 'Add'. Depending on your version of Ubuntu, add one of the following lines and then click 'Add Source':

 **Ubuntu 18.04**: `deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/` *Note, this installs R3.6

 **Ubuntu 16.04**: `deb https://cloud.r-project.org/bin/linux/ubuntu xenial/`

 **Ubuntu 15.10**: `deb https://cloud.r-project.org/bin/linux/ubuntu wily/`

 **Ubuntu 14.04**: `deb https://cloud.r-project.org/bin/linux/ubuntu trusty/`

 **Ubuntu 12.04**: `deb https://cloud.r-project.org/bin/linux/ubuntu precise/`

2. Then, Open terminal and issue the following commands to install the latest version of R:
 ```
 $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
 $ sudo apt-get update
 $ sudo apt-get install r-base
 $ sudo apt-get install libssl-dev
 $ sudo apt-get install libcurl4-openssl-dev
 ```
3. Choose and download the Ubuntu version of RStudio from https://www.rstudio.com/products/rstudio/download/
4. Ubuntu users can then install the downloaded file through the Software Center.
5. We will also be installing IRKernel to be able run R code inside of Jupyter. Open terminal and type ```sudo R```
6. Now run the following commands:
```
install.packages(c('repr', 'IRdisplay', 'crayon', 'pbdZMQ', 'devtools', 'stringr'), repos="http://cran.stat.sfu.ca/")
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()
```
Troubleshooting: http://askubuntu.com/a/614715

#### Windows Users

1. Go [here](https://cran.r-project.org/bin/windows/base/) and download R.
2. Open the R installation file and follow the installer. Leave the default options as-is.
3. Choose and download the Windows version of RStudio from https://www.rstudio.com/products/rstudio/download/preview/
4. Open the ```.exe``` file and install RStudio. Again, you can leave the installer options on their default settings.

Windows users will also need to install Rtools, which will allow you to use external libraries.

1. Go to http://cran.r-project.org/bin/windows/Rtools/ and download the latest version (e.g.: Rtools33.exe).
2. Run the installer; if you are only interested in building packages, you can accept the defaults throughout (_recommended_).
3. Confirm and finish. You should now have a new directory C:\Rtools on your computer.
4. Test your installation: Open R/RStudio as an Administrator and type ```install.packages("xtable", type="source")``` at the command line. If this runs successfully, Rtools should be installed!
5. We will also be installing IRKernel to be able run R code inside of Jupyter.
6. Run the following commands in RStudio:
```
install.packages(c('repr', 'IRdisplay', 'crayon', 'pbdZMQ', 'devtools', 'stringr'), repos="http://cran.stat.sfu.ca/")
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()
```


#### Testing R and RStudio
1.	Do whatever is appropriate for your OS to launch RStudio.

2.	Put your cursor in the pane labelled Console, which is where you interact with the live R process. Create a simple variable with code like ```x``` (followed by enter or return). Then inspect `x`  by typing ```x``` followed by enter or return. You should see the value `8` print to screen. If yes, you’ve succeeded in installing R and RStudio!

![Git](https://i.imgur.com/BWom2MO.png)

**Take a screenshot of the successful output of these commands to "prove" you correctly installed R and R Studio.**


## Installing a Text Editor
We need a text editor to be able to write complete applications. We will be using the open-source editor Atom.

### Atom (Mac, Ubuntu, Windows) and Notepad++ (Windows) Installation

#### Mac Users

Download ```atom-mac.zip ``` from 'Downloads' under the [latest release](https://github.com/atom/atom/releases).

Atom will automatically update when a new release is available.

#### Ubuntu Users
Currently __only a 64-bit version__ is available.

1. Open the terminal, and run: ```sudo apt-get install gconf2```
2. Download ```atom-amd64.deb``` from the [Atom releases page](https://github.com/atom/atom/releases).
3. Run ```sudo dpkg -i atom-amd64.deb``` on the downloaded package.
Launch Atom using the installed atom or atom-beta command, depending on which version you chose to install.
The Linux version does not currently automatically update so you will need to repeat these steps to upgrade to future releases(don't worry about this for now!).

#### Other Linux-Based Systems

Follow the instructions [here](https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-linux)

#### Windows Users

Download either the  [Atom installer](https://github.com/atom/atom/releases) ```AtomSetup-x64.exe``` from 'Downloads' under the latest release, or download the   [Notepad++](https://notepad-plus-plus.org/download) installer that corresponds to your version of Windows (32 or 64 bit).

Atom will automatically update when a new release is available, Notepad++ will prompt you on startup when a new update is available.

You can also download an ``` atom-windows.zip``` file from the releases page. The .zip version will not automatically update. A minimalist package is also available from Notepad++ that does not prompt for updates and does not require installation.

Using chocolatey? Run cinst Atom to install the latest version of Atom.

#### Testing Atom and Notepad++ installs
Open a terminal/Git Bash instance and type `atom`. The Atom text editor should open to an empty file. If you are using Notepad++, type `start notepad++` into your Git Bash instance to open Notepad++.

![Git](https://i.imgur.com/gVfqPSy.png)

**Take a screenshot of the successful opening of the Atom or Notepad++ text editors after you called it from the terminal/Git Bash to prove you correctly installed it.**

## Installing Microsoft Excel
We will also need to use Microsoft Excel to help manage data in spreadsheets and perform analysis.

#### Installing Microsoft Office 365
UBC students have free access to a Microsoft Office 365 annual subscription, which is renewed for students enrolled in at least one course. Office 365 includes Word, Excel, PowerPoint, Outlook, and OneNote, and is available on a variety of platforms, including Windows, Mac, and Linux/Android.

To get your free Office 365 license and download the installer files, visit [UBC IT] (https://it.ubc.ca/services/desktop-print-services/software-licensing/office-365-students) and click ```Download Office 365```. Note that you will need your CWL login credentials in order to download the software and activate your license.

**Take a screenshot of the successful opening of Microsoft Excel to prove that you correctly installed it.**

<!--!## Using SSH

We will securely connect to servers using the SSH command. SSH is built-in to the terminal for MacOS and [Windows 10](https://www.howtogeek.com/336775/how-to-enable-and-use-windows-10s-built-in-ssh-commands/). Another option is [Putty](https://www.putty.org/) on Windows machines.  To test, open a terminal window and type: 
```ssh userid@cosc304.ok.ubc.ca```. Your user id and password is your [UBC Novell account](https://it.ok.ubc.ca/service-catalogue/accounts/novell.html) that provides access to computers on campus. 

You can connect and run queries on the MySQL database on cosc304.ok.ubc.ca. MySQL has a command line interface that can be started by typing the command: ```mysql -u <userid> -p```. The ```-p``` indicates that a password is required. Your MySQL user id is the first letter in your first name followed by up to 7 letters of your last name and your initial password is your student id. You can run a query by typing: ```use workson;``` then ```SELECT * FROM emp```. There are more details in the [documentation for DATA 540](https://github.com/ubco-mds-2019/data_540/blob/master/labs/lab1/usemysql.md).

![SSH/MySQL Image](img/ssh_mysql.png)

**Take a screenshot of the successful SSH to cosc304.ok.ubc.ca. If possible, show running a query on MySQL but that is not required.** -->

## Submitting Via GitHub Classroom

To submit the assignment using Git, follow these steps:
1. In GitHub, go to your automatically created lab repository, then press the ```Clone or Download``` button. Copy the https link in the dropdown box.
2. Open Terminal (Mac/Linux) or Git Bash (Windows), and navigate to where you want to create your local copy of the repository.
3. Run ```git clone <Your https repo link>```. For example, I enter ```git clone https://github.com/ubco-mds-2019/data-530-lab-1-iadaji.git```. You will be prompted to enter your GitHub username and password.
4. Navigate into the new folder that has been created. Make your changes, adding or editing files to this new folder.
5. Run ```git config --global user.email "<Your Email you used for GitHub>"```
6. Run ```git config --global user.email "<Your GitHub Username>"```
7. Run ```git add -A``` to stage all new edits and files in the repository for committing.
8. Run ```git commit -m "<Your commit message>"``` to make a local commit of your changes. Your commit message should be a short description of what changes were made.
9. Run ```git push``` to push your local commit to the GitHub server. You may be asked for your GitHub username and password again. You should now see the changes you made reflected in GitHub's web interface.
10. Once all files are in the Git repository you may ask the TA to mark during the lab if possible. Otherwise, lab will be marked after lab due date.

## Three Useful Terminal Commands


You can use the terminal to navigate through your computer’s file system and run various applications. Windows users should use Git Bash (search for it in Start Menu), while Mac/Linux Users should open their terminals. Here are some useful commands that you should be familiar with (try them out!):

- ```pwd```  - shows the path of your current directory (i.e. tells you where you are)
on Windows, the terminal prompt contains the path of your current directory
- ```ls``` shows what is in the current directory
- ```cd <directory or path> ``` - change directory to the specified directory (**NOTE**: the use of the greater than and less than signs are meant to indicate that you need to type in whatever directory or path you want to go to. You should not literally type in these symbols into the terminal)
	-	```cd ..``` goes up one level, to the parent folder
	- *extra tip*: TAB does autocomplete for file names (start typing the name of a file/folder and press TAB before you finish typing)
 	- You can use the symbol ```~```as shorthand for your home directory. So for example ```cd ~/Desktop``` will probably get you to your desktop if you're on Mac/Linux. **Note**: This references an *absolute* path rather than a *relative* path -- it points directly to your home directory regardless of what directory you are currently in, rather than some place relative to the current directory you are in. The rest of the time when you use cd to navigate around you are usually specifying relative paths (path relative to where you are right now).

1.	Chose a folder where you want to save your work for this assignment.
2.	Open Atom, and write the following code:
```print test successful!``` and then go to *File -> Save As* and save the file with the extensiion ```.py``` in the directory you chose. For example, I saved the file as *test.py*.

3.	Now, in terminal, navigate to that folder using the commands you learned above.
4.	Once you are there, type:
```python <program name>.py ```. In this case, we type ```python test.py```. You should now see ```test successful!``` in your terminal.

You can do a lot more with a terminal. See software carpentry's [resources](http://swcarpentry.github.io/shell-novice/) on this.

## Documentation

The following resources will be very helpful in explaining how to work with the required languages and environments.

- [Python](https://docs.python.org/3/)
- [R](http://www.rdocumentation.org/)
- [RStudio](https://support.rstudio.com/hc/en-us/categories/200035113-Documentation)
- [Atom](https://atom.io/docs)
- [Notepad++](https://notepad-plus-plus.org/resources.html)
- [GitHub Classroom](https://www.youtube.com/watch?v=ChA_zph7aao)
- [Useful UNIX commands](http://mally.stanford.edu/~sr/computing/basic-unix.html)

## Troubleshooting

A lot of troubleshooting questions are answered on [Stack Overflow](http://stackoverflow.com/). We encourage you to use Stack Overflow throughout the program.


## Attributions
* [Harvard CS109](http://cs109.github.io/2015/)
* [UBC STAT 545](http://stat545.com/packages01_system-prep.html#mac-os-system-prep) licensed under the [CC BY-NC 3.0](https://creativecommons.org/licenses/by-nc/3.0/legalcode).
