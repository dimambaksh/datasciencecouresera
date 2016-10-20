corr <- function(directory, threshold = 0){
    datasetIn <- complete(directory)

    currentwd <- getwd()
    tempwd <- paste(currentwd, directory, sep="/")
    setwd(tempwd)
    
    correlationResults <- vector(mode = "numeric")
    j <- 1
        
    for(i in 1:nrow(datasetIn)){
      if (datasetIn$nobs[i] >= threshold){
        filenameIn <- file(paste(datasetIn$id[i], ".csv", sep=""),"r") 
        dataIn <- read.csv(filenameIn, header=TRUE)
        
        try(
          {correlationResults[j] <- cor(dataIn[2], dataIn[3], use="complete" ); j <- j + 1}, silent = TRUE
        )
        
        close(filenameIn)
        unlink(filenameIn)
      }
      
    }
    
    setwd(currentwd)
    correlationResults
}