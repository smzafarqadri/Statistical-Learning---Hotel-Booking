
trainData <- read.csv("hotel_bookings_train.csv")

str(trainData)

colSums(sapply(trainData, is.na))

hotel_booking2 <- na.omit(trainData)
hotel_booking2 <- hotel_booking2[-c(1)]
hotel_booking2$hotel <- factor(hotel_booking2$hotel)
hotel_booking2$is_canceled <- factor(hotel_booking2$is_canceled)
hotel_booking2$arrival_date_month <- factor(hotel_booking2$arrival_date_month)
hotel_booking2$meal <- factor(hotel_booking2$meal)
hotel_booking2$market_segment <- factor(hotel_booking2$market_segment)
hotel_booking2$country <- factor(hotel_booking2$country)
hotel_booking2$distribution_channel <- factor(hotel_booking2$distribution_channel)
hotel_booking2$is_repeated_guest <- factor(hotel_booking2$is_repeated_guest)
hotel_booking2$agent <- factor(hotel_booking2$agent)
hotel_booking2$reserved_room_type <- factor(hotel_booking2$reserved_room_type)
hotel_booking2$assigned_room_type <- factor(hotel_booking2$assigned_room_type)
hotel_booking2$deposit_type <- factor(hotel_booking2$deposit_type)
hotel_booking2$company <- factor(hotel_booking2$company)
hotel_booking2$customer_type <- factor(hotel_booking2$customer_type)
hotel_booking2$reservation_status_date <- as.Date(hotel_booking2$reservation_status_date)


str(hotel_booking2)
hotel_booking2$company <- as.numeric(hotel_booking2$company)
hotel_booking2$company[hotel_booking2$company == 313] <- 0
hotel_booking2$company <- factor(hotel_booking2$company)

hotel_booking2$agent <- as.numeric(hotel_booking2$agent)
hotel_booking2$agent[hotel_booking2$agent == 303] <- 0
hotel_booking2$agent <- factor(hotel_booking2$agent)


zz = as.numeric(hotel_booking2[,31])
# the first column is a label and then must be removed for the analysis
xxx = as.numeric(as.matrix(hotel_booking2[,-c(2)]))
ww = matrix(as.numeric(xxx),ncol=30)



###########################################################
#
# ```{r}
# str(hb_train)
# ```
# ```{r}
# hb_train <- na.omit(hb_train)
# hb_train$company[hb_train$company == "NULL"] <- 0
# hb_train$agent[hb_train$agent == "NULL"] <- 0
# head(hb_train$company)
# head(hb_train$agent)
# ```
# ```{r}
# trainData <- hb_train
# ```
# ```{r}
# trainData$hotel[trainData$hotel == "City Hotel"] <- 0
# trainData$hotel[trainData$hotel == "Resort Hotel"] <- 1
# ```
# 
# ```{r}
# hb_train$hotel <- factor(hb_train$hotel)
# head(hb_train$hotel)
# ```
# ```{r}
# hb_train$hotel<-as.numeric(hb_train$hotel)
# head(hb_train$hotel)
# ```
# ```{r}
# trainData$arrival_date_month<-factor(trainData$arrival_date_month)
# head(trainData$arrival_date_month)
# ```
# ```{r}
# trainData$arrival_date_month <- as.numeric(trainData$arrival_date_month)
# head(trainData$arrival_date_month)
# ```
# ```{r}
# table(trainData$arrival_date_month)
# ```
# ```{r}
# hotel_train <- read.csv("hotel_bookings_train.csv")
# 
# ```
# 
# ```{r}
# hotel_train$arrival_date_month <-  factor(hotel_train$arrival_date_month, levels = month.name)
# ```
# 
# ```{r}
# table(hotel_train$arrival_date_month)
# ```
# ```{r}
# hotel_train$arrival_date_month <- as.numeric(hotel_train$arrival_date_month)
# head(hotel_train$arrival_date_month)
# ```
# ```{r}
# hotel_train$arrival_date_month <- factor(hotel_train$arrival_date_month)
# str(hotel_train)
# ```
# ```{r}
# hotel_train$hotel <- as.numeric(hotel_train$hotel)
# ```













































































































































































