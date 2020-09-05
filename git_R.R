library(rio, ggplot2)
melbourne = import("~/Rworld/melb_data.csv")

library(ggplot2)
;ggplot(data = melbourne) + geom_point(mapping = aes(x= Longtitude, y =Lattitude, color = 'red'))
head(melbourne)

#plotting for categorical variables 
#using Facets 
ggplot(data = melbourne) +
  geom_point(mapping = aes(x= Longtitude, y =Lattitude)) +
  facet_wrap(~Regionname, nrow = 3)

#combinig geom_smooth to geom_point
ggplot(data = melbourne) +  geom_point(mapping = aes(x= Longtitude, y =Lattitude, color = 'red')) + geom_smooth(mapping = aes(x= Longtitude, y =Lattitude,linetype = Type))


ggplot(data = melbourne) + geom_point(mapping = aes(x= Landsize, y =Price, color = 'red')) +
  geom_smooth(mapping = aes(x= Landsize, y =Price)
)
ggplot(data = melbourne) + geom_point(mapping = aes(x= Longtitude, y =Lattitude, color = Propertycount))

ggplot(data = melbourne) +
  geom_point(mapping = aes(x= Rooms, y =Price)) +
  facet_wrap(~Type, nrow = 2)
 


#the data has to many categotical variable, so there is little we could do with scatterplot
#barchart
ggplot(data = melbourne) +
  geom_bar(mapping = aes(x = Regionname))

ggplot(data = melbourne) +
  stat_summary(mapping = aes(x = Regionname, y = Price),
               fun.ymin = min,
               fun.ymax = max,
               fun.y = median)
ggplot(data=melbourne) +
  geom_bar(mapping = aes(x =Regionname, fill = Type))


ggplot(data=melbourne) +
  geom_bar(mapping = aes(x =Regionname, fill = Type,), position = 'dodge')

m <- melbourne

head(rename(m, Region_name = Regionname))

library(nycflights13)
library(tidyverse)

fore <- import("~/Rworld/train_forecast1.csv")

View(fore)
f <- filter(fore, store==1, sales ==10)


f2 <- select(f, date, item )
arrange(f2, desc(item))

f3 <- mutate(fore, 
       sales_per_item = sales / item)

View(f3)


#finding the number of missing value in variable Car in missing data.
v <- is.na(melbourne$Car)
rerun = 0
for (i in v){
  if (i==TRUE){
    rerun =rerun + 1
  }
}
print(rerun)

fore_selected <- select(fore, store, sales, item)
#using group by
summarize(fore, delay = mean(sales))

group <- group_by(fore_selected, store, item)
ffile <- summarize(group, item_sum = sum(sales))
write_csv(ffile, "save.csv")
