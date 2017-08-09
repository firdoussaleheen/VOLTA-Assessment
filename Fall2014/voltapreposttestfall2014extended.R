library(HH)
library(xtable)
library(lattice)
library(latticeExtra)

#set directory
setwd("D:/RESEARCH/TempleVLA/Data Analysis/Fall2014") 

#import data into workspace
volta <- read.csv("student_test_score_fall2014_v4.csv", header=TRUE)

#view data
View(volta)

#check dimension number of rows and column
dim(volta)

#check first and last 6 rows of data
head(volta)
tail(volta)

#check variable names
names(volta)

#extract specific variable with $ sign and apply a function
mean(volta$PretestScore)

#attach the data, the variable can be accessed directly by name, memory expensive
attach(volta)
# detach data
detach(volta)

#check the variable category
class(volta)
class(volta$DayID)
class(volta$PretestScore)
#find the levels of categorical variable
levels(volta$DayID)

#summerize data statistics, mean, min, max, 1st, 3rd quarter, median
summary(volta)

#barplot
#find pretest score bar chart for all students
PretestScoreFreq <- table(volta$PretestScore)
barplot(PretestScoreFreq, main="Pre-test Score Distribution", 
xlab = "Score", ylab="No. of Students", las=1)

#find pretest score clustered barchart
PretestScoreFreq <- table(volta$GroupID,volta$PretestScore) 
barplot(PretestScoreFreq, main="Groupwise Pre-test Score Distribution",
xlab="Score",ylab="Number of Students", beside=T, 
legend.text=c("Control group","Experimental group"), col=c(2,4))




#split and save a data frame into csv/text file

#split and save a data frame into csv/text file
voltasplit <- split(volta, volta$GroupID)
voltasplitControl <- voltasplit$Control
voltasplitExperimental <- voltasplit$Experimental 



write.csv(voltasplitControl, file = "voltacontrol_fall2014_v1.csv")
write.csv(voltasplitExperimental, file = "voltaexperimental_fall2014_v1.csv")
#write.table(voltasplit$Control, file = "voltacontrol_spring2015_v1.txt", sep = "\t")

voltacontrol <- read.csv("voltacontrol_fall2014_v1.csv", header=TRUE)
voltaexperimental <- read.csv("voltaexperimental_fall2014_v1.csv", header=TRUE)

library(ggplot2)

#Function for combining plot
# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}







#pretest score of control grp
#png(file="controlsp2015.png",width=800,height=350,antialias="none")

p1<- ggplot(voltacontrol, aes(x=factor(LabID),y=PretestScore))+
geom_boxplot(fill = "white", color = "red")+
labs(title= "Pre-test Scores of Control Group", x="Lab assignment number", y = "Pre-test score")+
geom_jitter(shape=16, position=position_jitter(0.2), color = "red")+
stat_summary(fun.y=mean, geom="point", shape=23, size=5)+
theme(axis.text=element_text(size=14),
axis.title=element_text(size=14),
plot.title=element_text(size=14))
#dev.off()


#posttest score of control grp
#png(file="posttestcontrolsp2015.png",width=400,height=350,antialias="none")
p2<- ggplot(voltacontrol, aes(x=factor(LabID),y=PosttestScore))+
geom_boxplot(fill = "white", color = "red")+
labs(title= "Post-test Scores of Control Group", x="Lab assignment number", y = "Post-test score")+
geom_jitter(shape=16, position=position_jitter(0.2), color = "red")+
stat_summary(fun.y=mean, geom="point", shape=1, size=5)+
theme(axis.text=element_text(size=14),
axis.title=element_text(size=14),
plot.title=element_text(size=14))
multiplot(p1, p2,cols=2)
dev.off()


#pretest score of experimental grp
p3<- ggplot(voltaexperimental, aes(x=factor(LabID),y=PretestScore))+
geom_boxplot(fill = "white", color = "blue")+
labs(title= "Pre-test Scores of Experimental Group", x="Lab assignment number", y = "Pre-test score")+
geom_jitter(shape=16, position=position_jitter(0.2), color = "blue")+
stat_summary(fun.y=mean, geom="point", shape=23, size=5)+
theme(axis.text=element_text(size=14),
axis.title=element_text(size=14),
plot.title=element_text(size=14))
#dev.off()


#posttest score of experimental grp
#png(file="posttestexperimentalspring2015.png",width=400,height=350,antialias="none")
p4<- ggplot(voltaexperimental, aes(x=factor(LabID),y=PosttestScore))+
geom_boxplot(fill = "white", color = "blue")+
labs(title= "Post-test Scores of Experimental Group", x="Lab assignment number", y = "Post-test score")+
geom_jitter(shape=16, position=position_jitter(0.2), color = "blue")+
stat_summary(fun.y=mean, geom="point", shape=1, size=5)+
theme(axis.text=element_text(size=14),
axis.title=element_text(size=14),
plot.title=element_text(size=14))
#multiplot(p1, p2,cols=2)
#dev.off()

library(Cairo)
tiff(filename="testscorefall2014.tiff", width = 10, height = 7, units = 'in', res = 300, 
compression = "lzw", type = "cairo", antialias = "default")
multiplot(p1, p3, p2, p4, cols=2)
dev.off()














#ggtitle("Pretest Score of Control Group")+
#boxplot
boxplot(Pre.test.Score~Lab.Ass.ID, data=volta, 
main=toupper("Pre-test Score"), font.main=3, cex.main=1.2, 
xlab="Lab Assignment Number", ylab="Pre-test score", font.lab=3, col="darkgreen")




#anova
volta$Lab.Ass.ID <- factor(volta$Lab.Ass.ID)
volta$Student.ID <- factor(volta$Student.ID)
volta$Day.ID <- factor(volta$Day.ID)
volta$Group.ID <- factor(volta$Group.ID, labels=c("Experimental","Control"))
voltanova <- aov(Gain ~ Group.ID + Error(Lab.Ass.ID), data=volta)
summary(voltanova)

