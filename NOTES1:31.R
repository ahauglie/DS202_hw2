cities

#explore the dataset
str(cities)
class(cities)
#we have a data frame. data frame is a tabular format to store data. diff columns in a data frame can be of diff types.
names(cities)
#type number of rows you want
head(cities, 3) 
#to print the last rows use tail command
tail(cities)
#to see number of rows and columns use dim
dim(cities)
#to explore the df cities use summary, 1st Qu means 1st quartile
summary(cities)
#save cities to dat to appear in global environment and then you can see the df in a table 
dat <- cities
#View will pull up a table, make sure it's capitalized
View(dat)
#maybe you only want to see specific columns, 
#$ means take out a column
cities$Population
cities[['Population']] #this is the same as above
#gives you a summary of a specific column
summary(cities$Population)
#to take our first three columns df[row:row,first column:last column]
cities[,1:3]
#save to a variable to look at brief summary
a<- cities[,1:3]
str(a)
#better way to show this would be because if you specify columns using names it's easier to see what columns you're extracting
violent <- cities[, c('City', 'Population', 'Violent.crime')]
str(violent)
#extracting rows
cities[c(1,4,5),] #to extract first, fourth, and fifth rows
#another way would be to specify indicies, row indicies are integers above, below are logical vectors
cities[cities$City=='Ames',] #extracting only info for ames, row is ==Ames
rowInd <- cities$City=='Ames'
str(rowInd)
cities[rowInd,]
#you can combine these to specify a specific row and column
cities[1:3, c('City', 'Population')] #first three rows with only cities and pop

###Look at the first 10 data records of the cities data
cities[1:10,]
first10 <- cities[1:10,]
summary(first10$Burglary)
###Find mean and stdv of number of burglaries
cities$Burglary
mean(cities$Burglary) #there are NA in the dataset so figure out how to compute without NA
sd(cities$Burglary)
?NA #to remove NA use na.rm=TRUE
#go back and figure out how to remove NA 
mean(cities$Burglary, na.rm=TRUE)
sd(cities$Burglary, na.rm=TRUE)

#Which city has the most violent crimes?
cities$City #but doesn't show unique so 
unique(cities$City) #shows there are 137 unique cities
length(unique(cities$City)) #gives number of unique cities

dat2016 <- cities[cities$Year==2016, ] #subsetting data based on one year, take our rows corresponding w 2016
str(dat2016)
#reshape question to which city in 2016?
violent <- dat2016$Violent.crime
names(violent) <- dat2016$City
violent
#but if you don't want to scroll through, use sort command
sort(violent) #by default it's in increasing order
sort(violent, decreasing =TRUE) #first arguement is vector to be sorted, second is decreasing
a <- sort(violent, decreasing =TRUE)
# you can see the first 5 most violent cities
head(a, 5)

#graphics
hist(dat2016$Violent.crime)

boxplot(dat2016$Violent.crime) #severe outliers
#can't see graph clearly, prob wanna look at log 
boxplot(log(dat2016$Violent.crime))
#label y axis
boxplot(log(dat2016$Violent.crime + 1), ylab='(log number of violent crimes +1)')
#main title 
boxplot(log(dat2016$Violent.crime + 1), main='(log number of violent crimes +1)')

plot(cities$Population, cities$Violent.crime)
#here y ~ x is a formula which specifies the variables to be plotted
plot(Violent.crime ~ Population, data =cities)
#to make it easier to read use log plot
plot(log(cities$Population), log(cities$Violent.crime +1))

x <- log(dat2016$Population)
y <- log(dat2016$Violent.crime +1)
plot(x,y)
city <- dat2016$City
x[city =='Ames'] #log pop for Ames
y[city =='Ames'] # log crime for Ames
points(x[city =='Ames'], y[city =='Ames'], col ='red', pch=2, cex=3)
#cex is for size
#pch is for shape 