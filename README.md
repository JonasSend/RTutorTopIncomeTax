Author: Jonas Send

In their paper **"Optimal Taxation of Top Labor Incomes: A Tale of Three Elasticities"** Thomas Piketty, Emmanuel Saez and Stefanie Stantcheva (2014) analyse the response of top earners to taxes and derive optimal tax rate formulas from their findings. In this interactive offline *R* Tutorial, we are going to gradually reproduce their study and discuss it.

## 1. Installation

To install RTutor and this problem set, run in R the code:
```s
if (!require(devtools))
  install.packages("devtools")
source_gist("gist.github.com/skranz/fad6062e5462c9d0efe4")
install.rtutor(update.github=TRUE)
  
install_github("JonasSend/RTutorTopIncomeTaxation")
```

## 2. Show and work on the problem set
To start the problem set first pick a directory in which you want to store files related to the problem set and your solution. Then adapt and run the following code.

```s
library(RTutorTopIncomeTaxation)

# Adapt your working directory to an existing folder
setwd("C:/problemsets")
# Adapt your user name
run.ps(user.name="Jon Doe")
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.