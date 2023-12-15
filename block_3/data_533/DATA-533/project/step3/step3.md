# DATA 533: Collaborative Software Development

# Project Step 3

## Objective
1. Understanding how to set up continuous integration 
2. Understanding how to write code to handle errors and exceptions 

## Overall goal
- In this lab, you will work collaboratively in the group you formed in Project Step 1. 
- This time, you will set up continuous integration using any CI/CD tools (e.g., Travis-CI). You will work on the same modules and methods that you developed in your project step 2; however, you will add more codes that handle errors and exceptions gracefully. 
- You must ensure that the test suite for each function provides at least 75% coverage (if less, please consult with the instructor or the TA). Please include documentation (e.g., screenshots of [coverage.py](https://coverage.readthedocs.io/en/7.3.2/) report) that shows you’ve checked for code coverage. 
- Please ensure that continuous integration is set up (e.g., using Travis-CI or any other tool), and the package README contains a status image showing the [status of your build](https://docs.travis-ci.com/user/status-images/#travis-ci-pages-show-the-default-branchs-result).

## Specific Expectations (20 marks)
- [4 marks] You need to configure continuous integration testing using Travis-CI or any other tool.
    - You can create a new GitHub repository and store your project step 2 code there. If you do so, add the other group member as a collaborator to the repository.
    - Clone the repository to your local machine. Create a new branch and write new code there.
    - Ask your group member to clone the GitHub repository and write code in a new branch.
    - Frequently push your updated code (i.e., the local repositories - at least once a day) to the GitHub repository.
    - You must need to configure continuous integration testing to handle the builds automatically
    - Create pull requests and merge your code into the master branch.
- [6 marks] At least six methods contain appropriate error and exception handlers (out of six exceptions, one exception should be user-defined exceptions).
- [3 marks] You must ensure that the test suite for each function provides at least 75% coverage.
    - Provide screenshots showing the coverage reports
- [1 mark] Your package README should contain a passing build stamp (see Resources).
- [2 marks] Upload a video describing the functionalities of the package, sub-package, and modules, showing how they work (5 min max - similar to the video that I shared with you before).
- [2 marks] Have a Git history demonstrating that the group members contributed equally.
- [2 marks] Publish the package (i.e., upload the package to PyPi) and add the link to the README file.

## Submission instructions: 

Please submit your GitHub or GitHub classroom link to Canvas (one submission from a group is good enough)


## Resources
- [Create CI Infrastructure Using Python, GitHub, and Travis CI](https://microsoft.github.io/PartsUnlimitedMRP/pandp/200.1x-PandP-PythonCI.html)
- [Embedding Status Images – Travis CI](https://docs.travis-ci.com/user/status-images/)
- [Embedding Status Images/Repository Badges – GitHub](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge)
