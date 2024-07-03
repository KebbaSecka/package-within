#reading the swim.csv file
infile <- "swim.csv"
dat <- read.csv(infile)


#classifying the English into US or UK based on response in the 'where' column
dat$english[dat$where == "beach"] <- "US"
dat$english[dat$where == "coast"] <- "US"
dat$english[dat$where == "seashore"] <- "UK"
dat$english[dat$where == "seaside"] <- "UK"

#converting the US temperatures in Celsius
dat$temp[dat$english == "US"] <- (dat$temp[dat$english == "US"] - 32) * 5/9


#The data is written back out to a CSV file capturing the time stamp in the file name
now <- Sys.time()
timestamp <- format(now, "%Y-%B-%d_%H-%M-%S")
(outfile <- paste0(timestamp, "_", sub("(.*)([.]csv$)", "\\1_clean\\2", infile)))
#> [1] "2024-July-02_07-14-51_swim_clean.csv"
write.csv(dat, file = outfile, quote = FALSE, row.names = FALSE)
