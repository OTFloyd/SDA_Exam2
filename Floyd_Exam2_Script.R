#                           Date Conversion for Time Lapse                     #


#Read in csv
eagle <- read.csv(file = "Alaska_Bald_Eagle_Nest_Sites_(USFWS).csv", header = T, stringsAsFactors = F)

#Create a string of the dates listed in the CSV
date = eagle$modayyr

#Extract the first four characters from each datum in the string
year <- substr(date, 1, 4)   

#Check for validity
head(year)

#Re-input the year-only string into the dataframe
eagle$year <- year

#Double check work
head(eagle)


#                         Longitude Value Tidying/Fix                          #


#Subset the longitude values into a string of their absoute values
abslong = abs(eagle$longitude)

#Double check
head(abslong)

#Add back into the dataframe
eagle$abslong <- abslong

#Add a negative sign in front of each value in the abslong column
correctedlong <- paste("-", eagle$abslong, sep="")

#Double check work
head(correctedlong)

#Add fully corrected longitude into the dataframe
eagle$LongFixed <- correctedlong

#Write corrected CSV
write.csv(x = eagle, file="AK_EagleNest_Corrected.csv")

