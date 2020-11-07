library("withr", lib.loc="C:\\Users\\mmari\\AppData\\Local\\Temp\\RtmpmO97EK\\downloaded_packages")
library("devtools", lib.loc="C:\\Users\\mmari\\AppData\\Local\\Temp\\RtmpmO97EK\\downloaded_packages")
library("memoise", lib.loc="C:\\Users\\mmari\\AppData\\Local\\Temp\\RtmpmO97EK\\downloaded_packages")
library("digest", lib.loc="C:\\Users\\mmari\\AppData\\Local\\Temp\\RtmpmO97EK\\downloaded_packages")
library("magrittr", lib.loc="C:\\Users\\mmari\\OneDrive\\Documents\\R\\win-library\\3.3")
library("grid", lib.loc="C:\\Users\\mmari\\OneDrive\\Documents\\R\\win-library\\3.3")
library("backports", lib.loc="C:\\Users\\mmari\\OneDrive\\Documents\\R\\win-library\\3.3")
library("checkmate", lib.loc="C:\\Users\\mmari\\OneDrive\\Documents\\R\\win-library\\3.3")
library("forestplot", lib.loc="C:\\Users\\mmari\\OneDrive\\Documents\\R\\win-library\\3.3")

install.packages("withr")
install.packages("devtools")
install.packages("memoise")
install.packages("digest")
install.packages("magrittr")
install.packages("grid")
install.packages("backports")
install.packages("checkmate")
install.packages("forestplot")


#df = read.table(args[1], header=TRUE)
#df = read.table("C:\\wamp64\\www\\input.txt", header=TRUE)
#colnames(df)

#For each row we do a chi^2 and get p-value and odds-ratio
#Each column is a,b,c,d, these are the 4 numbers in the 2x2 table.  	
#Each row represents a "study"



#library(MASS)       # load the MASS package 
#tbl = table(survey$Smoke, survey$Exer) 
#tbl                 # the contingency table 
 
#        Freq None Some 
#  Heavy    7    1    3 
#  Never   87   18   84 
#  Occas   12    3    4 
#  Regul    9    1    7
  
#chisq.test();
  
cochrane_from_rmeta <- 
  structure(list(
    mean  = c(NA, NA, 0.578, 0.165, 0.246, 0.700, 0.348, 0.139, 1.017, NA, 0.531), 
    lower = c(NA, NA, 0.372, 0.018, 0.072, 0.333, 0.083, 0.016, 0.365, NA, 0.386),
    upper = c(NA, NA, 0.898, 1.517, 0.833, 1.474, 1.455, 1.209, 2.831, NA, 0.731)),
    .Names = c("mean", "lower", "upper"), 
    row.names = c(NA, -11L), 
    class = "data.frame")

tabletext<-cbind(
  c("", "Study", "Auckland", "Block", 
    "Doran", "Gamsu", "Morrison", "Papageorgiou", 
    "Tauesch", NA, "Summary"),
  c("Deaths", "(steroid)", "36", "1", 
    "4", "14", "3", "1", 
    "8", NA, NA),
  c("Deaths", "(placebo)", "60", "5", 
    "11", "20", "7", "7", 
    "10", NA, NA),
  c("", "OR", "0.58", "0.16", 
    "0.25", "0.70", "0.35", "0.14", 
    "1.02", NA, "0.53"))

jpeg('C:\\wamp64\\www\\rplot.jpg')
forestplot(tabletext, 
           cochrane_from_rmeta,new_page = TRUE,
           is.summary=c(TRUE,TRUE,rep(FALSE,8),TRUE),
           clip=c(0.1,2.5), 
           xlog=TRUE, 
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"),
		   title=colnames(df)
		   )
#dev.copy(jpg,'C:\\wamp64\\www\\rplot.jpg')
dev.off()