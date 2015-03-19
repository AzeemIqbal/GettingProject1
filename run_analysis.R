library(dplyr)
library(tidyr)
library(reshape2)

## Assumes you have the relevant data files in your working dir

run <- function() {
  # Reading data
  x <- read.table('train/X_train.txt')
  y <- read.table('train/y_train.txt')
  subj <- read.table('train/subject_train.txt')
  features <- read.table('features.txt')
  x1 <- read.table('test/X_test.txt')
  y1 <- read.table('test/y_test.txt')
  subj1 <- read.table('test/subject_test.txt')
  
  # Setting column names for our data frames
  colnames(x) <- features$V2
  colnames(x1) <- features$V2
  
  # Creating two data frames of columns we want, one for training and
  # the other for test, then rbinding together
  meanstd <- filter(features, grepl('mean',V2) | grepl('std',V2))
  x <- x[,meanstd$V1]
  x1 <- x1[,meanstd$V1]
  df <- cbind(x,subj,y)
  df1 <- cbind(x1,subj1,y1)
  df <- rbind(df,df1)
  colnames(df)[80] <- 'Subject'
  colnames(df)[81] <- 'Activity'
  
  # Converting Activity column to factor and renaming values, tidying up
  # column names
  df$Activity <- as.factor(df$Activity)
  df$Activity <- factor(c('Walking','Walking Upstairs',
                'Walking Downstairs','Sitting','Standing','Laying')[df$Activity])
  colnames(df) <- gsub('-',' ',colnames(df))
  colnames(df) <- gsub('\\()','',colnames(df))
  
  # Creating new data set
  melted <- melt(df,id=c('Activity','Subject'))
  newdf <- dcast(melted,Activity+Subject~variable,mean)
  newdf
}