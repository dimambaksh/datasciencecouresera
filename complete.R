complete <- function(directory, id = 1:332){
  currentwd <- getwd()
  tempwd <- paste(currentwd, directory, sep="/")
  setwd(tempwd)
  
  idDataFrameIDs <- character(length(id))
  idDataFrameNOBs <- numeric(length(id))
  j <- 1
  
  for(i in id){
    filenumberIn <- formatC(i,width = 3, flag = 0, zero.print = TRUE)
    filenameIn <- file(paste(filenumberIn, ".csv", sep=""),"r") 
    dataIn <- read.csv(filenameIn, header=TRUE)
    
    dataNotNA <- complete.cases(dataIn)

    idDataFrameIDs[j] <- filenumberIn
    idDataFrameNOBs[j] <- nrow(dataIn[dataNotNA,])

    j <- j + 1
    
    close(filenameIn)
    unlink(filenameIn)
  }
  
  setwd(currentwd)
  data.frame(id = idDataFrameIDs, nobs = idDataFrameNOBs, stringsAsFactors=FALSE)
}