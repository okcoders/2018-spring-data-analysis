## Spring 2018 Data Analytics
Notes, Code Samples, Exercises, and Project Instructions for the [OU-CCEW OKCoders Data Analytics Boot Camp](http://okcoders.com/uncategorized/data-analytics-bootcamp-announced-for-spring-2018-in-okc/).


### Scope of the Course
This 8-week introductory bootcamp will cover the basics of data analytics using R and SQL. During the 8 weeks you’ll learn how to work with a relational SQL database, how to break down analytical questions into small sub-problems, and how to solve each with the R programming language. The class will cover the basics of working with data, statistical modeling, and some application of machine learning. This will include the completion of 2 analytical projects that can be shown in a code portfolio. The bootcamp is intended for beginners, but experienced developers are welcome as well.


### Technology Used in this Course
+ [Slack](https://slack.com/features): Slack is a messaging tool we will use to communicate inside and outside of the classroom. It is a suped-up instant messaging client that is used throughout many organizations for internal communications. It's super easy to use and you'll get the hang of it in no time.
+ [R Programming Language](https://www.r-project.org/about.html): This is a very popular programming language that is optimized for data analysis and very easy to understand. Lots of popular data analytics and data science platforms make first class use of R functionality. Additionally, R has a very active community of developers that have built freely available packages to do very powerful things right out of the box.
+ [RStudio](https://www.rstudio.com/products/RStudio/): This is what is called an IDE: an Integrated Development Environment. This is not only where you will write your code, it how you will run it and inspect what is going on while you are building your functionality. IDE's give you a ton of added functionality to make writing, testing, and working with your code much, much easier. RStudio is an incredibly powerful tool and hopefully will become a first class citizen of your analytics toolbox.
+ [SQL](https://en.wikipedia.org/wiki/SQL): The Structured Query Language (SQL) is the primary method for interacting with [Relational Databases](https://en.wikipedia.org/wiki/Relational_database). A Relational Database is a place to house data that neatly fits into rows and columns (think Excel, but far more powerful and scalable). We will use SQL to interact with data, do simple data connection and formatting operations, and even interact with SQL from inside the analytics pipelines we will write in R.
+ [SQLite](https://en.wikipedia.org/wiki/SQLite): The specific relational database engine and environment we are going to use will be SQLite (pronounced "Sequel Light"). SQLite is an entire database that saves to a single file. We will be able to interact with all major SQL commands using this light weight database, as well as connect to it directly with R to incorporate SQL and R programming pipelines together.
+ [SQLite Browser](http://sqlitebrowser.org/): This program will be how we primarily interact with our SQLite database files, and write SQL code to query various data sets. The SQLite Browser provides a great user interface for inspecting the different tables of our database, how they relate to one another, how they are formatted (the "schema"), and for writing queries with a live feedback loop on the query output.


### Datasets Used in this Course
+ **Company Employees**: This is a fake set of simple data that represents some company employees for a fake company. Various versions of this data will exist across several different formats, which will help show how the same kind of data can be represented in multiple ways. We will work with this data in CSV, JSON, and SQL formats. This data will be used for the first, smaller project.
+ **Lahman**: This is a famous very rich dataset that is produced each year regarding Baseball. We will be working with the SQL version of the data from the 2016 MLB Season. Documentation for this database can be found [here](http://seanlahman.com/files/database/readme2016.txt). This will be the data that is used for the final project.


### Projects
The details of the projects that we will build are still being finalized, please stay tuned as this page updates closer to the beginning of class.


### Additional Helpful Resources
There are a ton of resources out there to learn data analytics, machine learning, and data science. Some are great, some are crap, and most are in the middle somewhere. These are the ones that I find to be the best place to get started and learn a ton. Almost everything here is free or has a free version with a premium for additional help/coaching.
+ [TryR](http://tryr.codeschool.com/): We will actually use this resource right in class, but it is great to come back to at other times or to start with before class even begins to keep your R programming skills sharp. It's well designed, completely interactive, free, and runs right in your browser so you can learn elementary R programming without having to download anything.
+ [Udacity](https://www.udacity.com/): Of all the online interactive education platforms that teach technical skills, I find Udacity to be the far and away best. While many models seek to scale up the "college class" idea, Udacity built a platform that more simulates a personal tutor. You are required to actually answer questions and program solutions to be able to move ahead, and you can take as much time or as little as needed until you master a concept. Browse either their nanodegree concepts (which have paid elements), or look into their course catalog directly to learn anything you want to. If you are a little rusty on statistics, I would highly recommend their statistics courses; as well as their Machine Learning units.
+ [The Open Source Data Science Masters](http://datasciencemasters.org/): As you complete the basics of this course, if you want to go into Data Science--this is a fantastic place to look around. This is like a meta-index of the best (and almost all free) resources on the internet to teach you different Data Science skills.


### Timeline & Course Outline
<table>
    <thead>
        <tr>
            <th></th>
            <th>First Hour</th>
            <th>Second Hour</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th colspan="3" align="left">Week 1: Getting Started</th>
        </tr>
        <tr>
            <td>Mon</td>
            <td>Slack, GitHub Repo, Setting Up R/RStudio, Basic Functionality</td>
            <td>Basic R, data types, variables, vectors, simple functions</td>
        </tr>
        <tr>
            <td>Wed</td>
            <td>Basic Statistics, R data types/operations</td>
            <td>Slicing, Extracting, Thinking in a Vectorized way, Intro to TryR</td>
        </tr>
        <tr>
            <td>Homework</td>
            <td colspan="2" align="left">TryR: Section 1-4</td>
        </tr>
        <tr>
            <th colspan="3" align="left">Week 2: More R Functionality</th>
        </tr>
        <tr>
            <td>Mon</td>
            <td>Basic Statistical Functions, Seeds, Built-in Datasets</td>
            <td>Intro to DataFrames</td>
        </tr>
        <tr>
            <td>Wed</td>
            <td>CRAN/libraries, intro to dplyr</td>
            <td>dplyr functions (filter, slice, sample), pipeline operator</td>
        </tr>
        <tr>
            <td>Homework</td>
            <td colspan="2" align="left">TryR: Section 5-8</td>
        </tr>
        <tr>
            <th colspan="3" align="left">Week 3: Breaking Problems Down</th>
        </tr>
        <tr>
            <td>Mon</td>
            <td>Reading data from files, dplyr Summary Functions</td>
            <td>dplyr Joining, Aggregation Functions</td>
        </tr>
        <tr>
            <td>Wed</td>
            <td>Solving problems with dplyr tools so far</td>
            <td>dplyr Windowing Functions, Intro to Project 1</td>
        </tr>
        <tr>
            <td>Homework</td>
            <td colspan="2" align="left">Solving problems with dplyr</td>
        </tr>
        <tr>
            <th colspan="3" align="left">Week 4: First Data Analysis Project</th>
        </tr>
        <tr>
            <td>Mon</td>
            <td>Review so far: libraries, loading, dplyr</td>
            <td>Start work on Project 1</td>
        </tr>
        <tr>
            <td>Wed</td>
            <td>Data Reshaping, Live work on Project 1</td>
            <td>Live work on Project 1</td>
        </tr>
        <tr>
            <td>Homework</td>
            <td colspan="2" align="left">Project 1: Building a Data Flow Pipeline</td>
        </tr>
        <tr>
            <th colspan="3" align="left">Week 5: Working with a Database</th>
        </tr>
        <tr>
            <td>Mon</td>
            <td>Intro to SQL/Using the SQLite Browser</td>
            <td>SELECT & FROM clause, WHERE clause, basic functions</td>
        </tr>
        <tr>
            <td>Wed</td>
            <td>GROUP BY clause, INNER JOIN operations</td>
            <td>OUTER JOIN operations, CASE, SubQueries</td>
        </tr>
        <tr>
            <td>Homework</td>
            <td colspan="2" align="left">Answering Questions with SQL</td>
        </tr>
        <tr>
            <th colspan="3" align="left">Week 6: Beginning Modeling, Data Visualization</th>
        </tr>
        <tr>
            <td>Mon</td>
            <td>Intro to Modeling, Linear Regression, Interrogating Results</td>
            <td>How to set up a model, train/test, types of modeling</td>
        </tr>
        <tr>
            <td>Wed</td>
            <td>Regression vs Classification, Building Classification Model</td>
            <td>Putting SQL & R together, Data Visualization</td>
        </tr>
        <tr>
            <td>Homework</td>
            <td colspan="2" align="left">Building a simple regression & classification model</td>
        </tr>
        <tr>
            <th colspan="3" align="left">Week 7: Statistical Modeling</th>
        </tr>
        <tr>
            <td>Mon</td>
            <td>Hyper-parameter Tuning, Model Selection, ggplot2</td>
            <td>Preview of RMD, Preview of Final Project</td>
        </tr>
        <tr>
            <td>Wed</td>
            <td>Final Project: making a plan, getting the data ready</td>
            <td>Final project: encoding variables, feedback loop, basic viz</td>
        </tr>
        <tr>
            <td>Homework</td>
            <td colspan="2" align="left">Work on Final Project</td>
        </tr>
        <tr>
            <th colspan="3" align="left">Week 8: The Big Project</th>
        </tr>
        <tr>
            <td>Mon</td>
            <td>Final Project: getting model finalized end-to-end</td>
            <td>Final Project: Intro to RMD/RPubs</td>
        </tr>
        <tr>
            <td>Wed</td>
            <td>Final Project: Building the Write-up, Publishing your project</td>
            <td>Final Project: Share with Peers, Present your project</td>
        </tr>
    </tbody>
</table>


### Environment Setup
We will go over this in class, so don't feel too much pressure to have this done before coming. But if you can, please go ahead and set up the main components on your machine to ensure we move along speedily.

#### Slack
If you are on a Windows machine, please vist the [Slack Windows Download Center](https://slack.com/downloads/windows) and download the appropriate version for your OS. If you are using a Mac, the best way to install Slack is directly from the Mac App Store on your machine. We will not sign into the class Slack channel until the first day of class, so there is no need to do anything other than just making sure you can launch the app itself at least once.

#### R
+ Please go to the [R Download Site](https://cran.cnr.berkeley.edu/) and download the Mac/Windows version as applicable to your machine. The installation instructions are right there on the site, but the installation should be minimal effort. Please make sure you do this first before attempting to download or install RStudio.
+ Please go to the [RStudio Download Site](https://www.rstudio.com/products/rstudio/download/#download) and download the "Installer for Supported Platforms" version that corresponds to your machine.

#### SQL
Please go to the [SQLite Browser](http://sqlitebrowser.org/) home page and download the Mac/Windows version as applicable to your machine. Like the other tools the installation should be quite simple and I don't anticiapte any complications. Please verify that you can open this application once installed. This is the only technology we will need for the the SQL aspects of this course.


### About Me
Hi. I am your instructor, Frank D. Evans. I am a Data Scientist with [Exaptive](https://www.exaptive.com/), an OKC headquartered Data Applications company. I have worked in Data Analytics of one flavor or another for the past 9 years. My professional specialty is [Graph Structure Machine Learning](https://en.wikipedia.org/wiki/Graph_theory) and [Natural Language Processing](https://en.wikipedia.org/wiki/Natural-language_processing). If you'd like to snoop on me, the best places to start are my [LinkedIn](https://www.linkedin.com/in/frankdevans/), [Twitter](https://twitter.com/frankdevans) (which I don't use very often), [GitHub](https://github.com/frankdevans), and this awesome [image](http://www.golaurens.com/media/k2/galleries/28117/evans%20frank%2000001053211.jpg) of a guy that's definitely not me, but is the first [result](http://www.golaurens.com/crime-report/item/28117-arrest-report-for-november-6) if you Google "Frank Evans Felony".
