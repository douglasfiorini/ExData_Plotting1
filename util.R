downloadProject1File = function(){
  if (!file.exists('household_power_consumption.txt')){
    tmpFile = tempfile()
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = tmpFile, method = 'curl')  
    unzip(zipfile = tmpFile, exdir = '.')
    file.remove(tmpFile);
  }
}



