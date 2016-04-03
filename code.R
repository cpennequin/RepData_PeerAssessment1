
# Unzip the zip archive
unzip("activity.zip")

# Load data
activity <- read.csv("activity.csv", header = TRUE)

# Clean up
unlink("activity.csv")

# Ignore NA rows
data_complete <- activity[complete.cases(activity),]

# Summarize
library(plyr)
table_sum <- ddply(data_complete,.(date), summarize, "Total Steps"=sum(steps))
names(table_sum)[1] <- "Date"

# Compute 'hole' map
missing <- which(is.na(activity))

# New table
newActivity <- activity
for(i in 2:length(missing)){
    print(i)
    missing_interval <- activity[missing[i],3]
    replacement_value <- unname(mean_time_series[missing_interval])
    print(replacement_value)
    print(missing[i])
    newActivity[missing[i], 1] <- replacement_value
}
