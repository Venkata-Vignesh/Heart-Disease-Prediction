library(MASS)
heart<-read.csv("D:/VIT Semesters/Semester 6/DV THEORY/DV JCOMP/heart.csv")

dim(heart)

nrow(heart)

ncol(heart)

heart<-na.omit(heart)

head(heart)
library(ggplot2)
ggplot(heart, aes(x=RestingBP, y=Cholesterol)) + geom_point(size=2,shape=23)+ geom_smooth() #RestingBP vs Cholesterol

#HeartDisease vs MaxHR
logistic_model <- glm(HeartDisease ~ MaxHR, 
                      data = heart, 
                      family = "binomial") 
logistic_model
summary(logistic_model)

Predicted_data <- data.frame(MaxHR=seq(
  min(heart$MaxHR), max(heart$MaxHR),len=500))

Predicted_data$HeartDisease= predict(
  logistic_model, Predicted_data, type="response")

plot(HeartDisease ~ MaxHR, data=heart)
lines(HeartDisease ~ MaxHR, Predicted_data, lwd=2, col="green")



#HeartDisease vs Cholesterol
logistic_model <- glm(HeartDisease ~ Cholesterol, 
                      data = heart, 
                      family = "binomial") 
logistic_model
summary(logistic_model)

Predicted_data <- data.frame(Cholesterol=seq(
  min(heart$Cholesterol), max(heart$Cholesterol),len=500))

Predicted_data$HeartDisease= predict(
  logistic_model, Predicted_data, type="response")

plot(HeartDisease ~ Cholesterol, data=heart)
lines(HeartDisease ~ Cholesterol, Predicted_data, lwd=2, col="green")


#Sex vs HeartDisease
ggplot(data=heart, aes(x=Sex, y=HeartDisease, fill=Sex)) +
  geom_bar(stat="identity")


#RestingBP vs ExerciseAngina

heart$ExerciseAngina<-ifelse(heart$ExerciseAngina=="Y",1,0)
head(heart)

logistic_model <- glm(ExerciseAngina ~ RestingBP, 
                      data = heart, 
                      family = "binomial") 
logistic_model
summary(logistic_model)

Predicted_data <- data.frame(RestingBP=seq(
  min(heart$RestingBP), max(heart$RestingBP),len=500))

Predicted_data$ExerciseAngina= predict(
  logistic_model, Predicted_data, type="response")

plot(ExerciseAngina ~ RestingBP, data=heart)
lines(ExerciseAngina ~ RestingBP, Predicted_data, lwd=2, col="yellow")



#proportion of ChestPainType among people
mycols <- c("#42f55a", "#42f5e6", "#ecf542", "#f56f42")
ggplot(heart, aes(x = "", y = ChestPainType, fill = ChestPainType)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0)+ scale_fill_manual(values = mycols)



#stacked bar chart for ST_Slope vs HeartDisease Sex wise
ggplot(heart, aes(fill = Sex,
                 y = HeartDisease,
                 x = ST_Slope)) + 
  geom_bar(position = "stack",  
           stat="identity")

#Age vs Cholesterol
ggplot(heart, aes(x=Age,y=Cholesterol)) +geom_point() + geom_smooth()


#MaxHR vs RestingBP based on Sex

ggplot(heart, aes(x=Age,y=Cholesterol, color=Sex)) +geom_point(size=1, shape=23)


#RestingBP vs HeartDisease

logistic_model <- glm(HeartDisease ~ RestingBP, 
                      data = heart, 
                      family = "binomial") 
logistic_model
summary(logistic_model)

Predicted_data <- data.frame(RestingBP=seq(
  min(heart$RestingBP), max(heart$RestingBP),len=500))

Predicted_data$HeartDisease= predict(
  logistic_model, Predicted_data, type="response")

plot(HeartDisease ~ RestingBP, data=heart)
lines(HeartDisease ~ RestingBP, Predicted_data, lwd=2, col="red")




#density vs Oldpeak
ggplot(heart)+
  geom_histogram(aes( x = Oldpeak, y = ..density.., fill =  HeartDisease), position = position_dodge2())+
  geom_density(aes( x = Oldpeak), alpha =.3 ,fill = "orange")



#Sex vs RestingBP based on ChestPainType
library(dplyr)
heart$ChestPainType = if_else(heart$ChestPainType == "ATA", 0,
             if_else(heart$ChestPainType == "NAP",heart$ChestPainType=="ASY", 1))

heart %>%
  ggplot(aes(x=Sex,y=RestingBP))+
  geom_boxplot(fill="darkorange")+
  xlab("Sex")+
  ylab("BP")+
  facet_grid(~ChestPainType)

