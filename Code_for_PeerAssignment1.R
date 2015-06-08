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
