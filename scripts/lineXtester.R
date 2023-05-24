library(tidyverse)
library(agricolae)
library(gpbStat)

# the best DH lines obtained from analysis
the_best_lines_FT <- c("DH_PE0539", "DH_LL0018", "DH_PE0452", "DH_PE0025", "DH_KE0281",
                       "DH_PE0423", "DH_KE0239", "DH_KE0188", "DH_PE0060", "DH_PE0506"
                       ) 
the_best_lines_EV <- c('DH_PE0485', 'DH_PE0497', 'DH_PE0070', 'DH_PE0087', 'DH_PE0524', 
                       'DH_PE0385', 'DH_PE0519', 'DH_PE0419', 'DH_PE0115', 'DH_PE0418'
                       )
# Data preprocess
df <- read.csv('C:/Users/VlaD/Documents/Modern_Plant_Breeding_Workshop/SupplTableS3_LineXTester.csv', sep =  ';')

str(df)

ggplot(df, aes(x=paste(line, tester, sep="+"), y=yield, fill=line))+geom_boxplot()+xlab('line & tester combination')+theme_classic()


# LineXtester main analysis

df$line <- as.factor(df$line)
df$tester <- as.factor(df$tester)
output <- with(df,lineXtester(replication, line, tester, yield))

output1 <- ltc(df, replication, line, tester, yield)
output1