---
output:
  html_document:
    keep_md: yes
  pdf_document: default
  word_document: default
---
# Exploratory Data Analysis

The dataset for this report analysis is **Hotel Booking Demand,** which may be accessed in the **Assignments for final reports** section of MS-Teams as well as on the Kaggle platform: https://www.kaggle.com/jessemostipak/hotel-booking-demand.

This data collection comprises booking information for a city hotel and a resort hotel, including when the booking was made, duration of stay, number of adults, children, and/or babies, and number of available parking spaces, among other things.

Three datasets will be used in the analysis:  
**Train Data**: About 60% of the units of the original dataset.  
**Validation Data**: About 20% of the units of the original dataset.  
**Test Data**: About 20% of the units of the original dataset.  
The Target Variable to be predicted:  **is_canceled** in the training dataset, which consists of two classes “0” or “1”. 0 means “NO” and 1 means “Yes”.

This dataset on hotel bookings can assist us in answering following queries:
Have you ever thought about when the optimal time to book a hotel stay is? Or what is the best length of stay to get the greatest daily rate? What if you wanted to know whether a hotel was likely to receive an unusually large number of special requests?
Also we can utilize this dataset to conduct research on a variety of issues such as booking cancellation prediction, customer segmentation, customer satiation, seasonality, and so on.

## Attribute Specification

In the start we need to import our train dataset for the exploratory data analysis.



```r
str(hb_train)
```

```
## 'data.frame':	71633 obs. of  32 variables:
##  $ X                             : int  59084 12817 66660 68496 62083 8682 14848 62683 79422 46643 ...
##  $ hotel                         : chr  "City Hotel" "Resort Hotel" "City Hotel" "City Hotel" ...
##  $ is_canceled                   : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ lead_time                     : int  29 236 237 175 46 131 222 54 137 1 ...
##  $ arrival_date_year             : int  2016 2017 2017 2017 2017 2016 2015 2017 2016 2016 ...
##  $ arrival_date_month            : chr  "October" "July" "April" "May" ...
##  $ arrival_date_week_number      : int  43 29 16 20 1 42 38 3 5 3 ...
##  $ arrival_date_day_of_month     : int  21 17 22 19 1 9 15 18 27 14 ...
##  $ stays_in_weekend_nights       : int  0 5 2 0 2 2 1 0 0 0 ...
##  $ stays_in_week_nights          : int  2 11 2 1 0 1 5 3 2 1 ...
##  $ adults                        : int  2 2 2 1 2 2 2 2 1 1 ...
##  $ children                      : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ babies                        : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ meal                          : chr  "BB" "HB" "BB" "BB" ...
##  $ country                       : chr  "AUT" "PRT" "FRA" "PRT" ...
##  $ market_segment                : chr  "Online TA" "Online TA" "Online TA" "Groups" ...
##  $ distribution_channel          : chr  "TA/TO" "TA/TO" "TA/TO" "TA/TO" ...
##  $ is_repeated_guest             : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ previous_cancellations        : int  0 0 0 0 0 0 25 0 1 0 ...
##  $ previous_bookings_not_canceled: int  0 0 0 0 0 0 0 0 0 0 ...
##  $ reserved_room_type            : chr  "A" "D" "A" "A" ...
##  $ assigned_room_type            : chr  "A" "D" "A" "A" ...
##  $ booking_changes               : int  0 0 0 0 0 1 0 0 0 0 ...
##  $ deposit_type                  : chr  "No Deposit" "No Deposit" "No Deposit" "Non Refund" ...
##  $ agent                         : chr  "9" "242" "9" "44" ...
##  $ company                       : chr  "NULL" "NULL" "NULL" "NULL" ...
##  $ days_in_waiting_list          : int  0 0 0 0 0 0 0 0 45 0 ...
##  $ customer_type                 : chr  "Transient" "Transient" "Transient" "Transient" ...
##  $ adr                           : num  139 183 113 90 65 ...
##  $ required_car_parking_spaces   : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ total_of_special_requests     : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ reservation_status_date       : chr  "2016-09-22" "2017-05-06" "2016-10-26" "2016-11-25" ...
```

```r
length(unique(hb_train$X))
```

```
## [1] 71633
```

The dataset contains initially 71633 observations of 32 variables. We will drop the first variable which is for the Id of the hotels which has all the unique values of 71633 in total.


```r
colSums(sapply(hb_train, is.na))
```

```
##                              X                          hotel 
##                              0                              0 
##                    is_canceled                      lead_time 
##                              0                              0 
##              arrival_date_year             arrival_date_month 
##                              0                              0 
##       arrival_date_week_number      arrival_date_day_of_month 
##                              0                              0 
##        stays_in_weekend_nights           stays_in_week_nights 
##                              0                              0 
##                         adults                       children 
##                              0                              2 
##                         babies                           meal 
##                              0                              0 
##                        country                 market_segment 
##                              0                              0 
##           distribution_channel              is_repeated_guest 
##                              0                              0 
##         previous_cancellations previous_bookings_not_canceled 
##                              0                              0 
##             reserved_room_type             assigned_room_type 
##                              0                              0 
##                booking_changes                   deposit_type 
##                              0                              0 
##                          agent                        company 
##                              0                              0 
##           days_in_waiting_list                  customer_type 
##                              0                              0 
##                            adr    required_car_parking_spaces 
##                              0                              0 
##      total_of_special_requests        reservation_status_date 
##                              0                              0
```

The dataset contain 2 missing values in the children variable so we will omit these missing values from the dataset.
When above transformation has been made, now the dataset has 31 variables with 71631 observations. Following are the variable type and description to understand the nature of the variable as per the information was collected.

**hotel:** Categorical, booking information for a city hotel or a resort hotel  
**is_canceled:** Categorical, Value indicating if the booking was canceled (1) or not (0)  
**lead_time:** Integer, Number of days that elapsed between the entering date of the booking into the PMS and the arrival date  
**arrival_date_year:** Integer,	Year of arrival date  
**arrival_date_month:** Categorical, Month of arrival date with 12 categories: “January” to “December”  
**arrival_date_week_number:**	Integer, Week number of the arrival date  
**arrival_date_day_of_month:** Integer,	Day of the month of the arrival date  
**stays_in_weekend_nights:** Integer,	Number of weekend nights (Saturday or Sunday) the guest stayed or booked to stay at the hotel  
**stays_in_week_nights:** Integer, Number of week nights (Monday to Friday) the guest stayed or booked to stay at the hotel  
**adults:** Integer, Number of adults  
**children:** Integer, Number of children  
**babies:** Integer, Number of babies  
**meal:** Categorical, Type of meal booked. Categories are presented in standard hospitality meal packages: Undefined/SC – no meal package; BB – Bed & Breakfast; HB – Half board (breakfast and one other meal – usually dinner);  
**country:** Categorical, Country of origin  
**market_segment:** Categorical, Market segment designation. In categories, the term “TA” means “Travel Agents” and “TO” means “Tour Operators”  
**distribution_channel:** Categorical, Booking distribution channel. The term “TA” means “Travel Agents” and “TO” means “Tour Operators”  
**is_repeated_guest:** Categorical, Value indicating if the booking name was from a repeated guest (1) or not (0)  
**previous_cancellations:** Integer, Number of previous bookings that were canceled by the customer prior to the current booking  
**agent:** Categorical, ID of the travel agency that made the booking  
**previous_bookings_not_canceled:** Integer, Number of previous bookings not canceled by the customer prior to the current booking  
**reserved_room_type:** Categorical, Code of room type reserved. Code is presented instead of designation for anonymity reasons  
**assigned_room_type:** Categorical, Code for the type of room assigned to the booking. Sometimes the assigned room type differs from the reserved room type due to hotel operation reasons (e.g. overbooking) or by customer request. Code is presented instead of designation for anonymity reasons  
**booking_changes:** Integer, Number of changes or amendments made to the booking from the moment the booking was entered on the PMS until the moment of check-in or cancellation  
**deposit_type** Categorical, Indication on if the customer made a deposit to guarantee the booking. This variable can assume three categories: No Deposit – no deposit was made; Non Refund – a deposit was made in the value of the total stay cost; Refundable – a deposit was made with a value under the total cost of stay  
**company** Categorical, ID of the company/entity that made the booking or responsible for paying the booking. ID is presented instead of designation for anonymity reasons  
**days_in_waiting_list:** Integer, Number of days the booking was in the waiting list before it was confirmed to the customer  
**customer_type:** Categorical, Type of booking, assuming one of four categories: Contract - when the booking has an allotment or other type of contract associated to it; Group – when the booking is associated to a group; Transient – when the booking is not part of a group or contract, and is not associated to other transient booking; Transient-party – when the booking is transient, but is associated to at least other transient booking
**adr:** Numeric,	Average Daily Rate as defined  
**required_car_parking_spaces:** Integer, Number of car parking spaces required by the customer  
**total_of_special_requests:** Integer, Number of special requests made by the customer (e.g. twin bed or high floor)  
**reservation_status_date:** Date, Date at which the last status was set. This variable can be used in conjunction with the Reservation Status to understand when was the booking canceled or when did the customer checked-out of the hotel




```r
str(hotel_booking)
```

```
## 'data.frame':	71631 obs. of  31 variables:
##  $ hotel                         : Factor w/ 2 levels "City Hotel","Resort Hotel": 1 2 1 1 1 2 2 1 1 1 ...
##  $ is_canceled                   : Factor w/ 2 levels "0","1": 2 2 2 2 2 2 2 2 2 2 ...
##  $ lead_time                     : int  29 236 237 175 46 131 222 54 137 1 ...
##  $ arrival_date_year             : int  2016 2017 2017 2017 2017 2016 2015 2017 2016 2016 ...
##  $ arrival_date_month            : Factor w/ 12 levels "April","August",..: 11 6 1 9 5 11 12 5 5 5 ...
##  $ arrival_date_week_number      : int  43 29 16 20 1 42 38 3 5 3 ...
##  $ arrival_date_day_of_month     : int  21 17 22 19 1 9 15 18 27 14 ...
##  $ stays_in_weekend_nights       : int  0 5 2 0 2 2 1 0 0 0 ...
##  $ stays_in_week_nights          : int  2 11 2 1 0 1 5 3 2 1 ...
##  $ adults                        : int  2 2 2 1 2 2 2 2 1 1 ...
##  $ children                      : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ babies                        : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ meal                          : Factor w/ 5 levels "BB","FB","HB",..: 1 3 1 1 1 1 2 1 1 4 ...
##  $ country                       : Factor w/ 167 levels "ABW","AGO","AIA",..: 11 129 51 129 129 129 129 129 129 129 ...
##  $ market_segment                : Factor w/ 7 levels "Aviation","Complementary",..: 7 7 7 5 5 5 5 6 5 7 ...
##  $ distribution_channel          : Factor w/ 5 levels "Corporate","Direct",..: 4 4 4 4 4 1 1 4 4 4 ...
##  $ is_repeated_guest             : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
##  $ previous_cancellations        : int  0 0 0 0 0 0 25 0 1 0 ...
##  $ previous_bookings_not_canceled: int  0 0 0 0 0 0 0 0 0 0 ...
##  $ reserved_room_type            : Factor w/ 10 levels "A","B","C","D",..: 1 4 1 1 1 1 1 1 1 1 ...
##  $ assigned_room_type            : Factor w/ 12 levels "A","B","C","D",..: 1 4 1 1 1 1 1 1 1 1 ...
##  $ booking_changes               : int  0 0 0 0 0 1 0 0 0 0 ...
##  $ deposit_type                  : Factor w/ 3 levels "No Deposit","Non Refund",..: 1 1 1 2 1 1 2 2 2 1 ...
##  $ agent                         : Factor w/ 303 levels "1","10","103",..: 294 99 294 224 303 303 109 55 131 2 ...
##  $ company                       : Factor w/ 313 levels "100","102","103",..: 313 313 313 313 313 313 313 313 313 313 ...
##  $ days_in_waiting_list          : int  0 0 0 0 0 0 0 0 45 0 ...
##  $ customer_type                 : Factor w/ 4 levels "Contract","Group",..: 3 3 3 3 4 4 3 3 3 3 ...
##  $ adr                           : num  139 183 113 90 65 ...
##  $ required_car_parking_spaces   : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ total_of_special_requests     : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ reservation_status_date       : Date, format: "2016-09-22" "2017-05-06" ...
```

The Dataset consists of 14 variables that are categorical type, 16 variables that are of numeric type and 1 variable of Date type.
The main objective is to find out which criteria are the most successful in the forecast of cancellations of bookings. In this report, we will also classify our dataset by various techniques so that we can calculate the maximum precision for the main purpose. This helps us lower the booking cancellation after realizing which aspects have to be increased or decreased to mitigate the booking cancellation.

## Data Exploration

Given Below are the descriptive statistics of the hotel booking train dataset;


```
##           hotel       is_canceled   lead_time     arrival_date_year
##  City Hotel  :47586   0:45099     Min.   :  0.0   Min.   :2015     
##  Resort Hotel:24045   1:26532     1st Qu.: 18.0   1st Qu.:2016     
##                                   Median : 69.0   Median :2016     
##                                   Mean   :103.8   Mean   :2016     
##                                   3rd Qu.:160.0   3rd Qu.:2017     
##                                   Max.   :737.0   Max.   :2017     
##                                                                    
##  arrival_date_month arrival_date_week_number arrival_date_day_of_month
##  August : 8293      Min.   : 1.00            Min.   : 1.00            
##  July   : 7632      1st Qu.:16.00            1st Qu.: 8.00            
##  May    : 7133      Median :28.00            Median :16.00            
##  October: 6699      Mean   :27.19            Mean   :15.77            
##  April  : 6625      3rd Qu.:38.00            3rd Qu.:23.00            
##  June   : 6569      Max.   :53.00            Max.   :31.00            
##  (Other):28680                                                        
##  stays_in_weekend_nights stays_in_week_nights     adults      
##  Min.   : 0.0000         Min.   : 0.000       Min.   : 0.000  
##  1st Qu.: 0.0000         1st Qu.: 1.000       1st Qu.: 2.000  
##  Median : 1.0000         Median : 2.000       Median : 2.000  
##  Mean   : 0.9247         Mean   : 2.497       Mean   : 1.857  
##  3rd Qu.: 2.0000         3rd Qu.: 3.000       3rd Qu.: 2.000  
##  Max.   :18.0000         Max.   :42.000       Max.   :55.000  
##                                                               
##     children           babies                 meal          country     
##  Min.   : 0.0000   Min.   : 0.000000   BB       :55337   PRT    :29092  
##  1st Qu.: 0.0000   1st Qu.: 0.000000   FB       :  465   GBR    : 7257  
##  Median : 0.0000   Median : 0.000000   HB       : 8711   FRA    : 6306  
##  Mean   : 0.1043   Mean   : 0.007874   SC       : 6397   ESP    : 5138  
##  3rd Qu.: 0.0000   3rd Qu.: 0.000000   Undefined:  721   DEU    : 4362  
##  Max.   :10.0000   Max.   :10.000000                     ITA    : 2223  
##                                                          (Other):17253  
##        market_segment  distribution_channel is_repeated_guest
##  Aviation     :  144   Corporate: 4018      0:69339          
##  Complementary:  415   Direct   : 8752      1: 2292          
##  Corporate    : 3162   GDS      :  127                       
##  Direct       : 7608   TA/TO    :58733                       
##  Groups       :11857   Undefined:    1                       
##  Offline TA/TO:14534                                         
##  Online TA    :33911                                         
##  previous_cancellations previous_bookings_not_canceled reserved_room_type
##  Min.   : 0.0000        Min.   : 0.0000                A      :51591     
##  1st Qu.: 0.0000        1st Qu.: 0.0000                D      :11477     
##  Median : 0.0000        Median : 0.0000                E      : 3952     
##  Mean   : 0.0832        Mean   : 0.1365                F      : 1763     
##  3rd Qu.: 0.0000        3rd Qu.: 0.0000                G      : 1259     
##  Max.   :26.0000        Max.   :70.0000                B      :  646     
##                                                        (Other):  943     
##  assigned_room_type booking_changes       deposit_type       agent      
##  A      :44401      Min.   : 0.0000   No Deposit:62804   9      :19252  
##  D      :15159      1st Qu.: 0.0000   Non Refund: 8732   NULL   : 9781  
##  E      : 4755      Median : 0.0000   Refundable:   95   240    : 8302  
##  F      : 2240      Mean   : 0.2232                      1      : 4327  
##  G      : 1542      3rd Qu.: 0.0000                      14     : 2174  
##  C      : 1433      Max.   :21.0000                      7      : 2137  
##  (Other): 2101                                           (Other):25658  
##     company      days_in_waiting_list         customer_type        adr         
##  NULL   :67566   Min.   :  0.00       Contract       : 2450   Min.   :  -6.38  
##  40     :  540   1st Qu.:  0.00       Group          :  343   1st Qu.:  69.00  
##  223    :  464   Median :  0.00       Transient      :53821   Median :  94.67  
##  67     :  146   Mean   :  2.35       Transient-Party:15017   Mean   : 101.94  
##  45     :  141   3rd Qu.:  0.00                               3rd Qu.: 126.00  
##  153    :  128   Max.   :391.00                               Max.   :5400.00  
##  (Other): 2646                                                                 
##  required_car_parking_spaces total_of_special_requests reservation_status_date
##  Min.   :0.00000             Min.   :0.0000            Min.   :2014-10-17     
##  1st Qu.:0.00000             1st Qu.:0.0000            1st Qu.:2016-02-01     
##  Median :0.00000             Median :0.0000            Median :2016-08-06     
##  Mean   :0.06298             Mean   :0.5715            Mean   :2016-07-29     
##  3rd Qu.:0.00000             3rd Qu.:1.0000            3rd Qu.:2017-02-08     
##  Max.   :8.00000             Max.   :5.0000            Max.   :2017-09-14     
## 
```

We can see that in our dataset, certain variables have a mean that is higher than the median, while others have a median that is higher than the mean. So, in general, but not always, if the median is lower than the mean, we may see significant outliers at the high end of the distribution, while if the mean is lower than the median, we may see major outliers at the low end. To have a detailed overview of the variables, we will perform a univariate analysis to narrates the pattern of response to the variables.



```r
library(ggplot2)
ggplot(hotel_booking, aes(x = lead_time, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("lead_time") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-7-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = arrival_date_year, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("arrival_date_year") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = arrival_date_week_number, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("arrival_date_week_number") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

```r
ggplot(hotel_booking, aes(x = arrival_date_day_of_month, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("arrival_date_day_of_month") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

```r
ggplot(hotel_booking, aes(x = stays_in_weekend_nights, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("stays_in_weekend_nights") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-11-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = stays_in_week_nights, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("stays_in_week_nights") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-12-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = adults, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("adults") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-13-1.png)<!-- -->

```r
ggplot(hotel_booking, aes(x = children, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("children") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-14-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = babies, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("babies") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-15-1.png)<!-- -->

```r
ggplot(hotel_booking, aes(x = previous_cancellations, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("previous_cancellations") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-16-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = previous_bookings_not_canceled, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("previous_bookings_not_canceled") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-17-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = booking_changes, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("booking_changes") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-18-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = days_in_waiting_list, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("days_in_waiting_list") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-19-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = adr, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("adr") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-20-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = required_car_parking_spaces, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("required_car_parking_spaces") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-21-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(x = total_of_special_requests, y=..density..)) +
  geom_histogram(fill = "#6F8FAF", colour = "Black", bins = 5) +
  xlab("total_of_special_requests") +
  ylab("density")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-22-1.png)<!-- -->


```r
ggplot(data = hotel_booking,
       aes(
         x = hotel,
         y = prop.table(stat(count)),
         fill = is_canceled,
         label = scales::percent(prop.table(stat(count)))
       )) +
  geom_bar(position = position_dodge()) +
  geom_text(
    stat = "count",
    position = position_dodge(.9),
    vjust = -0.5,
    size = 4
  ) +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Reservation Status by Hotel Type", x = "Hotel Type", y = "Percentage") +
  theme_classic() +
  scale_fill_discrete(
    name = "Reservation Status",
    labels = c("Not Cancelled", "Cancelled")
  )
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-23-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(arrival_date_month, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 2) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Month", x = "Month", y = "Count") +
  scale_x_discrete(labels = month.abb)
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-24-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(meal, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 3) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Meal", x = "Meal", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-25-1.png)<!-- -->

```r
ggplot(hotel_booking, aes(country == "PRT" , fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 3) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Portugal and Other Countries", x = "Country Portugal", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-26-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(deposit_type, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 3) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Deposit type", x = "Deposit Type", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-27-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(is_repeated_guest, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
    geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 3) +
  labs(title = "Reservation Status by Repeated Guests", x = "Repeated Guest", y = "count") +
  theme_classic() +
  scale_fill_discrete(
    name = "Reservation Status",
    labels = c("Not Cancelled", "Cancelled")
  )
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-28-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(customer_type, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 3) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Customer type", x = "Customers", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-29-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(market_segment, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 3) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Market Segment", x = "Market", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-30-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(distribution_channel, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 3) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Distribution Channel", x = "Distribution Channel", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-31-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(company != "NULL", fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 3) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Company", x = "Company", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-32-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(reserved_room_type, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 2) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Reserved room type", x = "Reserved room type", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-33-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(assigned_room_type, fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 2) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Assined room type", x = "Assigned room type", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-34-1.png)<!-- -->


```r
ggplot(hotel_booking, aes(agent == "NULL", fill = is_canceled)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(.9),
    vjust = -0.5,
    size = 2) +
  scale_fill_discrete(
    name = "Reservation Status",
    label = c("Not Cancelled", "Cancelled")
  ) +
  labs(title = "Reservation Status by Agent", x = "Agent", y = "Count")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-35-1.png)<!-- -->


```r
str(hotel_booking)
```

```
## 'data.frame':	71631 obs. of  31 variables:
##  $ hotel                         : Factor w/ 2 levels "City Hotel","Resort Hotel": 1 2 1 1 1 2 2 1 1 1 ...
##  $ is_canceled                   : Factor w/ 2 levels "0","1": 2 2 2 2 2 2 2 2 2 2 ...
##  $ lead_time                     : int  29 236 237 175 46 131 222 54 137 1 ...
##  $ arrival_date_year             : int  2016 2017 2017 2017 2017 2016 2015 2017 2016 2016 ...
##  $ arrival_date_month            : Factor w/ 12 levels "April","August",..: 11 6 1 9 5 11 12 5 5 5 ...
##  $ arrival_date_week_number      : int  43 29 16 20 1 42 38 3 5 3 ...
##  $ arrival_date_day_of_month     : int  21 17 22 19 1 9 15 18 27 14 ...
##  $ stays_in_weekend_nights       : int  0 5 2 0 2 2 1 0 0 0 ...
##  $ stays_in_week_nights          : int  2 11 2 1 0 1 5 3 2 1 ...
##  $ adults                        : int  2 2 2 1 2 2 2 2 1 1 ...
##  $ children                      : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ babies                        : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ meal                          : Factor w/ 5 levels "BB","FB","HB",..: 1 3 1 1 1 1 2 1 1 4 ...
##  $ country                       : Factor w/ 167 levels "ABW","AGO","AIA",..: 11 129 51 129 129 129 129 129 129 129 ...
##  $ market_segment                : Factor w/ 7 levels "Aviation","Complementary",..: 7 7 7 5 5 5 5 6 5 7 ...
##  $ distribution_channel          : Factor w/ 5 levels "Corporate","Direct",..: 4 4 4 4 4 1 1 4 4 4 ...
##  $ is_repeated_guest             : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
##  $ previous_cancellations        : int  0 0 0 0 0 0 25 0 1 0 ...
##  $ previous_bookings_not_canceled: int  0 0 0 0 0 0 0 0 0 0 ...
##  $ reserved_room_type            : Factor w/ 10 levels "A","B","C","D",..: 1 4 1 1 1 1 1 1 1 1 ...
##  $ assigned_room_type            : Factor w/ 12 levels "A","B","C","D",..: 1 4 1 1 1 1 1 1 1 1 ...
##  $ booking_changes               : int  0 0 0 0 0 1 0 0 0 0 ...
##  $ deposit_type                  : Factor w/ 3 levels "No Deposit","Non Refund",..: 1 1 1 2 1 1 2 2 2 1 ...
##  $ agent                         : Factor w/ 303 levels "1","10","103",..: 294 99 294 224 303 303 109 55 131 2 ...
##  $ company                       : Factor w/ 313 levels "100","102","103",..: 313 313 313 313 313 313 313 313 313 313 ...
##  $ days_in_waiting_list          : int  0 0 0 0 0 0 0 0 45 0 ...
##  $ customer_type                 : Factor w/ 4 levels "Contract","Group",..: 3 3 3 3 4 4 3 3 3 3 ...
##  $ adr                           : num  139 183 113 90 65 ...
##  $ required_car_parking_spaces   : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ total_of_special_requests     : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ reservation_status_date       : Date, format: "2016-09-22" "2017-05-06" ...
```



```r
hb_sub <- hotel_booking[-c(1,2,5,13:17,20,21,23:25,27,31)]
library(psych)
```

```
## Warning: package 'psych' was built under R version 4.0.5
```

```
## 
## Attaching package: 'psych'
```

```
## The following objects are masked from 'package:ggplot2':
## 
##     %+%, alpha
```

```r
## Warning: package 'psych' was built under R version 4.0.5
pairs.panels(hb_sub, main= "Correlation between the Variables",
ellipses = FALSE, gap = 0)
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-37-1.png)<!-- -->


```r
library(corrplot)
```

```
## corrplot 0.84 loaded
```

```r
corr.mat <- cor(hb_sub)
corrplot(corr.mat, method = "number")
```

![](Hotel_Booking_files/figure-html/unnamed-chunk-38-1.png)<!-- -->


