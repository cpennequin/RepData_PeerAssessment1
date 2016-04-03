# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data


```r
# Unzip the zip archive
unzip("activity.zip")

# Load data
activity <- read.csv("activity.csv", header = TRUE)

# Clean up
unlink("activity.csv")
```

## What is mean total number of steps taken per day?

For this part of the assignment, you can ignore the missing values in
the dataset.


```r
# Ignore NA rows
activity_complete <- activity[complete.cases(activity),]
```

1. Calculate the total number of steps taken per day


```r
# Summarize and beautify table
library(plyr)
table_sum <- ddply(activity_complete,.(date), summarize, "Total Steps"=sum(steps))
names(table_sum)[1] <- "Date"

# Print the table
library(xtable)
xt <- xtable(table_sum, 
      caption="Table: Daily total steps")

print(xt,
      type="html",
      include.rownames = getOption("xtable.include.rownames", FALSE),
      html.table.attributes = getOption("xtable.html.table.attributes",
                                        "border=1 align=center"))
```

<!-- html table generated in R 3.1.3 by xtable 1.8-0 package -->
<!-- Mon Feb 15 05:50:47 2016 -->
<table border=1 align=center>
<caption align="bottom"> Table: Daily total steps </caption>
<tr> <th> Date </th> <th> Total Steps </th>  </tr>
  <tr> <td> 2012-10-02 </td> <td align="right"> 126 </td> </tr>
  <tr> <td> 2012-10-03 </td> <td align="right"> 11352 </td> </tr>
  <tr> <td> 2012-10-04 </td> <td align="right"> 12116 </td> </tr>
  <tr> <td> 2012-10-05 </td> <td align="right"> 13294 </td> </tr>
  <tr> <td> 2012-10-06 </td> <td align="right"> 15420 </td> </tr>
  <tr> <td> 2012-10-07 </td> <td align="right"> 11015 </td> </tr>
  <tr> <td> 2012-10-09 </td> <td align="right"> 12811 </td> </tr>
  <tr> <td> 2012-10-10 </td> <td align="right"> 9900 </td> </tr>
  <tr> <td> 2012-10-11 </td> <td align="right"> 10304 </td> </tr>
  <tr> <td> 2012-10-12 </td> <td align="right"> 17382 </td> </tr>
  <tr> <td> 2012-10-13 </td> <td align="right"> 12426 </td> </tr>
  <tr> <td> 2012-10-14 </td> <td align="right"> 15098 </td> </tr>
  <tr> <td> 2012-10-15 </td> <td align="right"> 10139 </td> </tr>
  <tr> <td> 2012-10-16 </td> <td align="right"> 15084 </td> </tr>
  <tr> <td> 2012-10-17 </td> <td align="right"> 13452 </td> </tr>
  <tr> <td> 2012-10-18 </td> <td align="right"> 10056 </td> </tr>
  <tr> <td> 2012-10-19 </td> <td align="right"> 11829 </td> </tr>
  <tr> <td> 2012-10-20 </td> <td align="right"> 10395 </td> </tr>
  <tr> <td> 2012-10-21 </td> <td align="right"> 8821 </td> </tr>
  <tr> <td> 2012-10-22 </td> <td align="right"> 13460 </td> </tr>
  <tr> <td> 2012-10-23 </td> <td align="right"> 8918 </td> </tr>
  <tr> <td> 2012-10-24 </td> <td align="right"> 8355 </td> </tr>
  <tr> <td> 2012-10-25 </td> <td align="right"> 2492 </td> </tr>
  <tr> <td> 2012-10-26 </td> <td align="right"> 6778 </td> </tr>
  <tr> <td> 2012-10-27 </td> <td align="right"> 10119 </td> </tr>
  <tr> <td> 2012-10-28 </td> <td align="right"> 11458 </td> </tr>
  <tr> <td> 2012-10-29 </td> <td align="right"> 5018 </td> </tr>
  <tr> <td> 2012-10-30 </td> <td align="right"> 9819 </td> </tr>
  <tr> <td> 2012-10-31 </td> <td align="right"> 15414 </td> </tr>
  <tr> <td> 2012-11-02 </td> <td align="right"> 10600 </td> </tr>
  <tr> <td> 2012-11-03 </td> <td align="right"> 10571 </td> </tr>
  <tr> <td> 2012-11-05 </td> <td align="right"> 10439 </td> </tr>
  <tr> <td> 2012-11-06 </td> <td align="right"> 8334 </td> </tr>
  <tr> <td> 2012-11-07 </td> <td align="right"> 12883 </td> </tr>
  <tr> <td> 2012-11-08 </td> <td align="right"> 3219 </td> </tr>
  <tr> <td> 2012-11-11 </td> <td align="right"> 12608 </td> </tr>
  <tr> <td> 2012-11-12 </td> <td align="right"> 10765 </td> </tr>
  <tr> <td> 2012-11-13 </td> <td align="right"> 7336 </td> </tr>
  <tr> <td> 2012-11-15 </td> <td align="right">  41 </td> </tr>
  <tr> <td> 2012-11-16 </td> <td align="right"> 5441 </td> </tr>
  <tr> <td> 2012-11-17 </td> <td align="right"> 14339 </td> </tr>
  <tr> <td> 2012-11-18 </td> <td align="right"> 15110 </td> </tr>
  <tr> <td> 2012-11-19 </td> <td align="right"> 8841 </td> </tr>
  <tr> <td> 2012-11-20 </td> <td align="right"> 4472 </td> </tr>
  <tr> <td> 2012-11-21 </td> <td align="right"> 12787 </td> </tr>
  <tr> <td> 2012-11-22 </td> <td align="right"> 20427 </td> </tr>
  <tr> <td> 2012-11-23 </td> <td align="right"> 21194 </td> </tr>
  <tr> <td> 2012-11-24 </td> <td align="right"> 14478 </td> </tr>
  <tr> <td> 2012-11-25 </td> <td align="right"> 11834 </td> </tr>
  <tr> <td> 2012-11-26 </td> <td align="right"> 11162 </td> </tr>
  <tr> <td> 2012-11-27 </td> <td align="right"> 13646 </td> </tr>
  <tr> <td> 2012-11-28 </td> <td align="right"> 10183 </td> </tr>
  <tr> <td> 2012-11-29 </td> <td align="right"> 7047 </td> </tr>
   </table>

2. Make a histogram of the total number of steps taken each day


```r
hist(table_sum[,2], xlab="Total steps taken", ylab="Number of days", main="Histogram for Total steps taken per day", col="green", breaks = seq(0,25000, 1000))
```

![](PA1_template_files/figure-html/unnamed-chunk-4-1.png) 

3. Calculate and report the mean and median total number of steps taken per day


```r
calculated_mean <- mean(table_sum$"Total Steps")
formatted_mean <- prettyNum(calculated_mean,big.mark = ",", decimal.mark = ".")
print(paste("Mean: ", formatted_mean))
```

```
## [1] "Mean:  10,766.19"
```

```r
calculated_median <- median(table_sum$"Total Steps")
formatted_median <- prettyNum(calculated_median,big.mark = ",", decimal.mark = ".")
print(paste("Median: ", formatted_median))
```

```
## [1] "Median:  10,765"
```

The **mean** total number of steps taken per day is **10,766.19**.
The **median** total number of steps taken per day is **10,765**.


## What is the average daily activity pattern?

1. Make a time series plot (i.e. `type = "l"`) of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)


```r
mean_time_series <- tapply(activity_complete$steps, activity_complete$interval, mean)

plot(type="l",
     mean_time_series,
     main="Average number of steps taken",
     xlab="5-minute interval",
     ylab="Average across all days")
```

![](PA1_template_files/figure-html/unnamed-chunk-6-1.png) 


2. Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?


```r
interval_max_steps <- which.max(mean_time_series)
interval <- names(interval_max_steps)
max_mean <- mean_time_series[interval]
formatted_max <- prettyNum(max_mean,big.mark = ",", decimal.mark = ".")
print(interval)
```

```
## [1] "835"
```

```r
print(max_mean)
```

```
##      835 
## 206.1698
```

The answer is the interval **835** at minutes with a maximum of **206.1698**.


## Imputing missing values

1. Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with `NA`s)


```r
num_NA <- sum(is.na(activity))
```

There are **2304 rows** with missing values.

2. Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.

See [Dplyr cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf) for details


```r
# Compute 'hole' map
# missing <- which(is.na(activity))

# New table
# newActivity <- activity
# for(i in 1:length(missing)){
#     print(i)
#     missing_interval <- activity[missing[i],3]
#     replacement_value <- mean_time_series[missing_interval]
#     newActivity[missing[i], 1] <- replacement_value
# }
```


3. Create a new dataset that is equal to the original dataset but with the missing data filled in.

4. Make a histogram of the total number of steps taken each day and Calculate and report the **mean** and **median** total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?



## Are there differences in activity patterns between weekdays and weekends?
