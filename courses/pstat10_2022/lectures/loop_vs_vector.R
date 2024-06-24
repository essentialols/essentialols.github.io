# Test speed of different ways to calculate

library(rbenchmark)

benchmark("for loop"= {
  count <- 0
  for (rep in seq_len(10000)) {
    green <- sample(1:6, 1)
    red <- sample(1:6, 1)
    dice_sum <- green + red
    if (dice_sum == 6) {
      count <- count + 1 # The event occurs, so we increment the counter
    }
  }
  count/nreps
},
"replicate" = {
  replicate(10000, sum(sample(1:6, size =  2, replace = T))) |> head(10)
},
"simple" = {
  green <- sample(1:6, 10000, replace = T)
  red <- sample(1:6, 10000, replace = T)
  dice_sum = green + red
  proportion <- mean(green + red == 6)
},
replications = 1000,
columns = c("test", "replications", "elapsed",
            "relative", "user.self", "sys.self"))

