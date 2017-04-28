library(rpart)
library(rpart.plot)
library(C50)
library(randomForest)
library(caret)
library(RColorBrewer)
library(rattle)


setwd("~/DATASETS")
mushrooms_1 <- read.csv("mushrooms_dataset/mushrooms.csv")

# get the dimmension of the dataset
dim(mushrooms_1) # 8124 observations, 21 variables

# get the data structure of the dataset
str(mushrooms_1)

# get a full summary of the data
summary(mushrooms_1)

# counting the amount of class for each variables
class_count <- cbind.data.frame(Var = names(mushrooms_1), Total_class = sapply(mushrooms_1, function(x){as.numeric(length(levels(x)))}))
class_count # since there are only one class in veil.type, we won't use this variable as a predictor

mushrooms <- subset(mushrooms_1, select = -c(17)) # a new data frame excluding the veil.type column

# data looks good now, we can now use for making predictive models

# first, set.seed()
set.seed(9850)

sample_size <- floor((0.7) * nrow(mushrooms)) # 70% of the observations
train_ind <- sample(seq_len(nrow(mushrooms)), size = sample_size) # train set row numbers

# df[row_numbers, columns_numbers]
train <- mushrooms[train_ind, ] # 70% of observations for training
test <- mushrooms[-train_ind, ] # 30% of observations to represents as unseen data


# lets build a desicion tree using the rpart algorithm 
rpart_dtm <- rpart(class~., train, method = "class")
rpart_dtm

# plotting our rpart decision tree
# rpart.plot(rpart_dtm, extra = 101, fallen.leaves = TRUE)
fancyRpartPlot(rpart_dtm)

# predicting
pred1 <- predict(rpart_dtm, test, type = "class")
pred_table_rpart <- table(test[, "class"], predicted_rpart = pred1)
pred_table_rpart

# using the c5.0 algorithm to make a classification tree
c50_dtm <- C5.0(train[,-1], train[,1])
c50_dtm

# plotting our c5.0 classification tree 
plot(c50_dtm)

# using the random forest algorithm to determine the most important variable of a mushroom
rfm <- randomForest(class~., train)

# plotting the most important variable of mushroom
varImpPlot(rfm, main = "Important variables of mushroom")
