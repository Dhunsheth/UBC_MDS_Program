# DATA 582 Bayesian Inference

**Land Acknowledgement**

_We respectfully acknowledge the Syilx Okanagan Nation and their peoples, in whose territory UBC Okanagan is situated._


**Instructor**: Dr. Irene Vrbik (she/her/hers) [website](https://irene.vrbik.ok.ubc.ca/)

- _Office hour_: Thursday 3:30 - 4:30 (SCI 104)
- _Contact Info_: irene.vrbik@ubc.ca / 250-807-8872


**Teaching Assistant (TA)**: Yining Zhou


## Course Description

Introduction to Bayesian paradigm and tools for Data Science. Topics include Bayes theorem, prior, likelihood and posterior. A detailed analysis of the cases of binomial, normal samples, normal linear regression models. A significant focus will be on computational aspects of Bayesian problems using software packages. Restricted to students in the MDS program. 
_Prerequisite_: All of DATA 572, DATA 581.



## Learning outcomes

1. Calculate inverse probabilities using Bayes' Theorem
1. Calculated a likelihood function
1. Specify and describe the role of prior distributions
1. Combine prior distributions with likelihood to derive posterior distributions
1. Summarize posterior distributions in the context of Bayesian Inference 


## Marking and Evaluation

Grade items will be inputted on Canvas. Final grades will be caluclated according to the following weighing scheme. 

| Item | Weighting |
|------:|:-----------:|
| Assignments | 40% | 
| Quizes | 60% | 

Quiz 1 date:  Wednesday, April 10
Quiz 2 date: Wednesday April 24

## Assignments

There will two assignments during this module.  All assignments are to be submitted on Canvas.  I will be requiring a __well organized__ PDF or html document only.  The source file may be requested if any issues arise.  I have included some templates for your consideration

|  Assignment    | Solutions | Due Date |
|-----|---------------|------------------|
| [Assignment 1](assignments/Assignment1.pdf) | | Wednesday, April 10 |
| [Assignment 2](assignments/Assignment2.pdf) | | Wednesday, April 24 |

|  Template    | Compiled document |
|-----|---------------|
| [Rmarkdown](assignments/AssignmentTemplate.Rmd) | [html](assignments/AssignmentTemplate.html) | 
| [Rnw](assignments/AssignmentTemplate.Rnw) (requires LaTeX) | [PDF](assignments/AssignmentTemplate.pdf) | 

## Practice Problems

Some practice problems have been suggested in the following RMd document.  As far as I can tell, I don't believe the Bayes Rules! book has any solutions to the Exercises.  I have provided my own quick solutions to some select questions and would invite and appreciate any contributions to this document.

**Practice Problems** [no answers](exercises/PP_noans.html), [select answers](exercises/PP_sol.html)
**Practice Problems Part II** [no answers](exercises/PP_PartII.html)

## Course Material and Tools

**Programming Language**: We will be using [R](https://cran.r-project.org/) with [RStudio](https://www.rstudio.com/)
**Learning Management System**: Canvas

### Textbooks 

Bellow are some suggested,i.e. _not_ required textbooks.  I will be pulling and pointing to sections of these throughout the course and will reference them by the initialisms specified in bold text.

- **AG** Gelman, Andrew, et al. _Bayesian data analysis_. Chapman and
Hall/CRC, 2013.
- **PH** Hoff, Peter D^[Jesse Mu's R Markdown notes this book can be found at  https://github.com/jayelm/hoff-bayesian-statistics)] _A first course in Bayesian statistical methods_. Vol. 580. New York: Springer, 2009. 
- **WB** Bolstad, William M., and James M. Curran. _Introduction to Bayesian statistics_, John Wiley & Sons, 2016.
- **SL** Lynch, Scott M. _Introduction to Applied Bayesian Statistics and Estimation for Social Scientists_. Statistics for Social and Behavioral Sciences, Springer Science & Business Media, 2007.
- **BR** Alicia A. Johnson, Miles Q. Ott, Mine Dogucu. _Bayes Rules! An Introduction to Applied Bayesian Modeling_. Chapman and Hall/CRC, 2022. Available online: https://www.bayesrulesbook.com/ 

## Other resources:


- Stan website: https://mc-stan.org/ 
- Rstan website: https://mc-stan.org/users/interfaces/rstan 




## Lectures

**When**: Mon/Wed 9:30 - 11:00 AM <br>
**Where**: EME 1153 <br>

|| Topic | Optional Reading | Supplementary | 
|----| --- | --- | --- | 
|1| [An Introduction to Bayesian Inference](lectures/data_582_lecture1_intro.pdf) | [Summary of Useful Distributions](lectures/UsefulDistributions.pdf) | | 
| 2| [Bayesian Updating](lectures/data_582_lecture2_bayesian_updating.pdf) | [Refresher on Probability](https://betanalpha.github.io/assets/case_studies/probability_theory.html) | | 
| 3| [Beta-Binomial Model](lectures/data_582_lecture3_binomial_samples.pdf) | [BR Ch 3](https://www.bayesrulesbook.com/chapter-3.html) | |
| 4 | [Normal-Normal Model](lectures/data_582_lecture4_normal_samples.pdf) | [BR 5.3](https://www.bayesrulesbook.com/chapter-3.html) | [plots](code/lecture4.R), [gorey details](supplementary/normal-normal.pdf)
| 5 | [MCMC methods](lectures/data_582_lecture5_mcmc.pdf) | [video](https://www.youtube.com/watch?v=OTO1DygELpY&ab_channel=StataCorpLLC), [lecture of mutliparameter models](supplementary/data_582_lecture6_multidim_param.pdf)| 
| 6 | [Regression](lectures/data_582_lecture6_regression.pdf) | 
| 7 | [RStan](lectures/data_582_lecture7_rstan.pdf) | [Rstan tutorial for normal data](https://www.youtube.com/watch?v=YZZSYIx1-mw&ab_channel=BenLambert), [Stan User Guide](https://mc-stan.org/docs/2_25/stan-users-guide/index.html)


## Labs

The labs are on Mondays from  1:30 – 3:30 PM in EME 1153  <br>
Labs are structured as walk-though tutorials hosted by your TA that supplement the lecture material and help to develop practical skills and applications in R.

| Date | Topic | Lab code | Solutions |
|------|-------|----------|--------|
| Week 1 | [optional lab](https://irene.vrbik.ok.ubc.ca/quarto/data582_ind/01-probability.html)  | ||
| Week 2 | [Beta-Binomial](lab/02Lab.pdf) | ||
| Week 3 | [MCMCmethods](lab/lab3.pdf) | [Beta-BinomialMCMC.R](Beta-BinomialMCMC.R), [Normal-NormalMCMC.R](code/Normal-NormalMCMC.R), [normal-normal-logscale.R](code/normal-normal-logscale.R)||
| Week 4 | [Normal Regression](lab/lab4.pdf) | ||
| Week 5 | [Rstan](lab/lab5.pdf) | ||


## Grievances and Complaints Procedures
A student who has a complaint related to this course should follow the procedures summarized below.
- The student should attempt to resolve the matter with the instructor first. Students may talk first to someone other than the
instructor if they do not feel, for whatever reason, that they can directly approach the instructor.
- If the complaint is not resolved to the student's satisfaction, the student should go to the departmental chair John Braun at
SCI 388, 807-8032.

## Your Responsibilities
Your responsibilities to this class and to your education as a whole include attendance and participation. You have a
responsibility to help create a classroom environment where all may learn. At the most basic level, this means you will
respect the other members of the class and the instructor and treat them with the courtesy you hope to receive in return.
Inappropriate classroom behavior may include: disruption of the classroom atmosphere, engaging in non-class activities,
talking on a cell-phone, inappropriate use of profanity in classroom discussion, use of abusive or disrespectful language
toward the instructor, a student in the class, or about other individuals or groups.

## Academic Integrity
The academic enterprise is founded on honesty, civility, and integrity. As members of this enterprise, all students are
expected to know, understand, and follow the codes of conduct regarding academic integrity. At the most basic level, this
means submitting only original work done by you and acknowledging all sources of information or ideas and attributing
them to others as required. This also means you should not cheat, copy, or mislead others about what is your work.
Violations of academic integrity (i.e., misconduct) lead to the breakdown of the academic enterprise, and therefore serious
consequences arise and harsh sanctions are imposed. For example, incidences of plagiarism or cheating usually result in a
failing grade or mark of zero on the assignment or in the course. Careful records are kept to monitor and prevent recidivism.
A more detailed description of academic integrity, including the policies and procedures, may be found at
http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,54,111,959. If you have any questions about how academic
integrity applies to this course, consult with the instructor.

## Disability Assistance
If you require disability-related accommodations to meet the course objectives, please contact the Diversity Advisor of
Disability Resources located in the University Centre, Room 227. For more information about Disability Resources or
academic accommodations, please visit the website at: http://students.ok.ubc.ca/drc/welcome.html

## Equity, Human Rights, Discrimination and Harassment
UBC Okanagan is a place where every student, staff and faculty member should be able to study and work in an
environment that is free from human rights based discrimination and harassment. If you require assistance related to an
issue of equity, discrimination or harassment, please contact the Equity Office, your administrative head of unit, and/or your
unit’s equity representative. UBC Okanagan Equity Advisor: ph. 250-807-9291; email equity.ubco@ubc.ca
Web: http://equity.ok.ubc.ca

## Missing an Exam
Only students who miss the final exam for a reason that corresponds to the University of British Columbia Okanagan's
policy on excused absences from examinations will be permitted to take the final exam at a later time. A make-up exam
may have a question format different from the regular exam. If the reason for
absence is satisfactory, the student’s final exam will be worth more of the final grade. Further information on Academic
Concession can be found under Policies and Regulation in the Okanagan Academic Calendar
http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,48,0,0


