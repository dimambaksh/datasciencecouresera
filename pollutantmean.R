pollutantmean <- function(directory, pollutant, id = 1:332){
  currentwd <- getwd()
  tempwd <- paste(currentwd, directory, sep="/")
  setwd(tempwd)
  
  idVectorMean <- numeric()
  
  for(i in id){
    filenumberIn <- formatC(i,width = 3, flag = 0, zero.print = TRUE)
    filenameIn <- file(paste(filenumberIn, ".csv", sep=""),"r") 
    dataIn <- read.csv(filenameIn, header=TRUE)
    
    dataNotNA <- complete.cases(dataIn[pollutant])
    idVectorMean <- c(idVectorMean, dataIn[dataNotNA, pollutant])
    
    close(filenameIn)
    unlink(filenameIn)
  }
  
  setwd(currentwd)
  mean(idVectorMean)
}