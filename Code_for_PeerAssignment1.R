### Part 1
total_steps <- aggregate(steps ~ date, activity, sum)
mean_daily_steps <- aggregate(steps ~ date, activity, mean)
median_daily_steps <- aggregate(steps ~ date, activity, median)
hist(total_steps$steps, main = "Histogram of Total Steps in a Day", xlab = "Total Steps")

### Part 2
time_interval_steps <- aggregate(steps ~ interval, activity, mean)
plot(time_interval_steps$steps ~ time_interval_steps$interval, 
     type="l", main = "Average Number of Steps per Interval", 
     ylab="Number of Steps", xlab="Interval (5 minutes)")
max <- max(time_interval_steps$steps)
Max_Interval <- subset(time_interval_steps, time_interval_steps$steps == max)

### Part 3
NA_Values <- sum(is.na(activity$steps))
activity2 <- activity ## copies the data set so that the original one is not modified
len <- nrow(activity2) ## calculates how many rows in the data set
for(i in 1:len){
    if(is.na(activity2$steps[i]) == TRUE){ ##checks to see if the value is missing
        int <- activity2$interval[i] ## caluclates the interval number
        temp <- subset(time_interval_steps, interval == int) ## creates a temporary data frame that has been subseted to the single interval value needed
        activity2$steps[i] <- temp$steps ## replaces the NA value with the average
    }
}
total_steps2 <- aggregate(steps ~ date, activity2, sum)
hist(total_steps2$steps, main = "Histogram of Total Steps in a Day", xlab = "Total Steps")