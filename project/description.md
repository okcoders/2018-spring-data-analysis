### OKCoders: Data Analytics Spring 2018 Final Project
#### *How Much Does a Strikeout Cost?*

---

**Description**

I want you to use the Lahman database to determine how much a strkeout costs. From the 2016 edition of the Lahman baseball database I want you to analyze every pitcher for every team from 2007-2016 (10 years) that played in at least 10 games that year to derive a cost per strikeout for each team-year combination.

I want you then to analyze a few factors to see if you can build a regression model that would let you "get a good deal" on a full team pitching staff based on any of a few candidate elements: the weighted average career age (how long they have been playing for) of the pitching bullpen, the weighted average age of the pitching bullpen, the win-loss record ratio of the team over the prior year, and the probability of a walk for a given at bat for that team. I want you to restrict all analysis within regular season games--October doesn't count.

*Hint*: We will be able to restrict our focus to 4 tables withing the database: Master, Pitching, Teams, and Salaries

**Format**

Your analysis will be in the form of an analysis article written in R Markdown format, and published to RPubs. The blog post should have all relevant code as well as a description of the data, your methods, the model you build, and your analytical conclusions from it. The article should have at least 3 graphics made with ggplot embedded where they further the story you want to tell.
