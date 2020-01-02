corr <- function(directory, threshold = 0) {
  fileList <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  above <- numeric()
  
  for(i in 1:length(fileList)) {
    data <- read.csv(fileList[i], header = TRUE)
    data <- data[complete.cases(data), ]
    if(nrow(data) > threshold) {
      correlation <- cor(data[["sulfate"]], data[["nitrate"]])
      above <- append(above, correlation)
    }
  }
  above
}