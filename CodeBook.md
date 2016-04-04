# Code Book
Tyler Seekins  
April 3, 2016  
## Downloading the Raw Data

A description of the original dataset is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for this project is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of original study design and raw data

The README.txt file in the ./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset directory contains a description of the original study design and overview of the files included in the raw dataset.

A descripition of the raw data and original variables is available in the features_info.txt file in the ./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset directory. 

A list of variable names is available in the features.txt file in the ./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset directory.

Descriptive labels for each activitiy class are given in the activity_labels.txt file in the ./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset directory.

The raw data of interest in this dataset is composed of the following different files that need to be merged to create an overall dataset:

* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': Test subjects.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt': Test subjects.


###Cleaning of the data
The cleaning of the data in the run_analysis.R script uses the following process:

####2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
* First the features.txt and activities.txt files are read using the read.table function.
* Find features of interest with names containing "mean()" and "std()" are found using grep
* Using the features found above a vector specifying the columns to keep is created.
* Read X training and testing data. By Setting the colClasses parameter, only the columns with names containing mean() and std() (as determined above) are extracted.

####1. Merge Training and Test Sets
* The Y training and testing data is read
* The Subject training and testing data is read
* The data is merged using dplyr

####3. Apply descriptive activity labels.
* Activity labels are applied by using a dplyr join on the data_tbl created above and the activities table that was read above.

####4. Appropriately labels the data set with descriptive variable names.
Using the sub and gsub functions the following corrections were made:

* Replaced "BodyBody" typo with correction "Body"
* Deleted "." characters
* Replaced "t" prefix with "time"
* Replaced "f" prefix with "freq" 

####5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Group by Subject and activity and take the mean of each group
* Rename columns by adding prefix "meanof" to each column
* Write tidy dataset to text format

##Description of the groupmeans.txt file

```r
setwd('./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset')
tidy<-read.table('./groupmeans.txt',sep = " ",header=TRUE)
#Dimensions
print(dim(tidy))
```

```
## [1] 180  69
```

```r
#Summary
print(summary(tidy))
```

```
##  meanofSubject             meanofActivity meanoftimeBodyAccmeanX
##  Min.   : 1.0   LAYING            :30     Min.   :0.2216        
##  1st Qu.: 8.0   SITTING           :30     1st Qu.:0.2712        
##  Median :15.5   STANDING          :30     Median :0.2770        
##  Mean   :15.5   WALKING           :30     Mean   :0.2743        
##  3rd Qu.:23.0   WALKING_DOWNSTAIRS:30     3rd Qu.:0.2800        
##  Max.   :30.0   WALKING_UPSTAIRS  :30     Max.   :0.3015        
##  meanoftimeBodyAccmeanY meanoftimeBodyAccmeanZ meanoftimeBodyAccstdX
##  Min.   :-0.040514      Min.   :-0.15251       Min.   :-0.9961      
##  1st Qu.:-0.020022      1st Qu.:-0.11207       1st Qu.:-0.9799      
##  Median :-0.017262      Median :-0.10819       Median :-0.7526      
##  Mean   :-0.017876      Mean   :-0.10916       Mean   :-0.5577      
##  3rd Qu.:-0.014936      3rd Qu.:-0.10443       3rd Qu.:-0.1984      
##  Max.   :-0.001308      Max.   :-0.07538       Max.   : 0.6269      
##  meanoftimeBodyAccstdY meanoftimeBodyAccstdZ meanoftimeGravityAccmeanX
##  Min.   :-0.99024      Min.   :-0.9877       Min.   :-0.6800          
##  1st Qu.:-0.94205      1st Qu.:-0.9498       1st Qu.: 0.8376          
##  Median :-0.50897      Median :-0.6518       Median : 0.9208          
##  Mean   :-0.46046      Mean   :-0.5756       Mean   : 0.6975          
##  3rd Qu.:-0.03077      3rd Qu.:-0.2306       3rd Qu.: 0.9425          
##  Max.   : 0.61694      Max.   : 0.6090       Max.   : 0.9745          
##  meanoftimeGravityAccmeanY meanoftimeGravityAccmeanZ
##  Min.   :-0.47989          Min.   :-0.49509         
##  1st Qu.:-0.23319          1st Qu.:-0.11726         
##  Median :-0.12782          Median : 0.02384         
##  Mean   :-0.01621          Mean   : 0.07413         
##  3rd Qu.: 0.08773          3rd Qu.: 0.14946         
##  Max.   : 0.95659          Max.   : 0.95787         
##  meanoftimeGravityAccstdX meanoftimeGravityAccstdY
##  Min.   :-0.9968          Min.   :-0.9942         
##  1st Qu.:-0.9825          1st Qu.:-0.9711         
##  Median :-0.9695          Median :-0.9590         
##  Mean   :-0.9638          Mean   :-0.9524         
##  3rd Qu.:-0.9509          3rd Qu.:-0.9370         
##  Max.   :-0.8296          Max.   :-0.6436         
##  meanoftimeGravityAccstdZ meanoftimeBodyAccJerkmeanX
##  Min.   :-0.9910          Min.   :0.04269           
##  1st Qu.:-0.9605          1st Qu.:0.07396           
##  Median :-0.9450          Median :0.07640           
##  Mean   :-0.9364          Mean   :0.07947           
##  3rd Qu.:-0.9180          3rd Qu.:0.08330           
##  Max.   :-0.6102          Max.   :0.13019           
##  meanoftimeBodyAccJerkmeanY meanoftimeBodyAccJerkmeanZ
##  Min.   :-0.0386872         Min.   :-0.067458         
##  1st Qu.: 0.0004664         1st Qu.:-0.010601         
##  Median : 0.0094698         Median :-0.003861         
##  Mean   : 0.0075652         Mean   :-0.004953         
##  3rd Qu.: 0.0134008         3rd Qu.: 0.001958         
##  Max.   : 0.0568186         Max.   : 0.038053         
##  meanoftimeBodyAccJerkstdX meanoftimeBodyAccJerkstdY
##  Min.   :-0.9946           Min.   :-0.9895          
##  1st Qu.:-0.9832           1st Qu.:-0.9724          
##  Median :-0.8104           Median :-0.7756          
##  Mean   :-0.5949           Mean   :-0.5654          
##  3rd Qu.:-0.2233           3rd Qu.:-0.1483          
##  Max.   : 0.5443           Max.   : 0.3553          
##  meanoftimeBodyAccJerkstdZ meanoftimeBodyGyromeanX meanoftimeBodyGyromeanY
##  Min.   :-0.99329          Min.   :-0.20578        Min.   :-0.20421       
##  1st Qu.:-0.98266          1st Qu.:-0.04712        1st Qu.:-0.08955       
##  Median :-0.88366          Median :-0.02871        Median :-0.07318       
##  Mean   :-0.73596          Mean   :-0.03244        Mean   :-0.07426       
##  3rd Qu.:-0.51212          3rd Qu.:-0.01676        3rd Qu.:-0.06113       
##  Max.   : 0.03102          Max.   : 0.19270        Max.   : 0.02747       
##  meanoftimeBodyGyromeanZ meanoftimeBodyGyrostdX meanoftimeBodyGyrostdY
##  Min.   :-0.07245        Min.   :-0.9943        Min.   :-0.9942       
##  1st Qu.: 0.07475        1st Qu.:-0.9735        1st Qu.:-0.9629       
##  Median : 0.08512        Median :-0.7890        Median :-0.8017       
##  Mean   : 0.08744        Mean   :-0.6916        Mean   :-0.6533       
##  3rd Qu.: 0.10177        3rd Qu.:-0.4414        3rd Qu.:-0.4196       
##  Max.   : 0.17910        Max.   : 0.2677        Max.   : 0.4765       
##  meanoftimeBodyGyrostdZ meanoftimeBodyGyroJerkmeanX
##  Min.   :-0.9855        Min.   :-0.15721           
##  1st Qu.:-0.9609        1st Qu.:-0.10322           
##  Median :-0.8010        Median :-0.09868           
##  Mean   :-0.6164        Mean   :-0.09606           
##  3rd Qu.:-0.3106        3rd Qu.:-0.09110           
##  Max.   : 0.5649        Max.   :-0.02209           
##  meanoftimeBodyGyroJerkmeanY meanoftimeBodyGyroJerkmeanZ
##  Min.   :-0.07681            Min.   :-0.092500          
##  1st Qu.:-0.04552            1st Qu.:-0.061725          
##  Median :-0.04112            Median :-0.053430          
##  Mean   :-0.04269            Mean   :-0.054802          
##  3rd Qu.:-0.03842            3rd Qu.:-0.048985          
##  Max.   :-0.01320            Max.   :-0.006941          
##  meanoftimeBodyGyroJerkstdX meanoftimeBodyGyroJerkstdY
##  Min.   :-0.9965            Min.   :-0.9971           
##  1st Qu.:-0.9800            1st Qu.:-0.9832           
##  Median :-0.8396            Median :-0.8942           
##  Mean   :-0.7036            Mean   :-0.7636           
##  3rd Qu.:-0.4629            3rd Qu.:-0.5861           
##  Max.   : 0.1791            Max.   : 0.2959           
##  meanoftimeBodyGyroJerkstdZ meanoftimeBodyAccMagmean
##  Min.   :-0.9954            Min.   :-0.9865         
##  1st Qu.:-0.9848            1st Qu.:-0.9573         
##  Median :-0.8610            Median :-0.4829         
##  Mean   :-0.7096            Mean   :-0.4973         
##  3rd Qu.:-0.4741            3rd Qu.:-0.0919         
##  Max.   : 0.1932            Max.   : 0.6446         
##  meanoftimeBodyAccMagstd meanoftimeGravityAccMagmean
##  Min.   :-0.9865         Min.   :-0.9865            
##  1st Qu.:-0.9430         1st Qu.:-0.9573            
##  Median :-0.6074         Median :-0.4829            
##  Mean   :-0.5439         Mean   :-0.4973            
##  3rd Qu.:-0.2090         3rd Qu.:-0.0919            
##  Max.   : 0.4284         Max.   : 0.6446            
##  meanoftimeGravityAccMagstd meanoftimeBodyAccJerkMagmean
##  Min.   :-0.9865            Min.   :-0.9928             
##  1st Qu.:-0.9430            1st Qu.:-0.9807             
##  Median :-0.6074            Median :-0.8168             
##  Mean   :-0.5439            Mean   :-0.6079             
##  3rd Qu.:-0.2090            3rd Qu.:-0.2456             
##  Max.   : 0.4284            Max.   : 0.4345             
##  meanoftimeBodyAccJerkMagstd meanoftimeBodyGyroMagmean
##  Min.   :-0.9946             Min.   :-0.9807          
##  1st Qu.:-0.9765             1st Qu.:-0.9461          
##  Median :-0.8014             Median :-0.6551          
##  Mean   :-0.5842             Mean   :-0.5652          
##  3rd Qu.:-0.2173             3rd Qu.:-0.2159          
##  Max.   : 0.4506             Max.   : 0.4180          
##  meanoftimeBodyGyroMagstd meanoftimeBodyGyroJerkMagmean
##  Min.   :-0.9814          Min.   :-0.99732             
##  1st Qu.:-0.9476          1st Qu.:-0.98515             
##  Median :-0.7420          Median :-0.86479             
##  Mean   :-0.6304          Mean   :-0.73637             
##  3rd Qu.:-0.3602          3rd Qu.:-0.51186             
##  Max.   : 0.3000          Max.   : 0.08758             
##  meanoftimeBodyGyroJerkMagstd meanoffreqBodyAccmeanX
##  Min.   :-0.9977              Min.   :-0.9952       
##  1st Qu.:-0.9805              1st Qu.:-0.9787       
##  Median :-0.8809              Median :-0.7691       
##  Mean   :-0.7550              Mean   :-0.5758       
##  3rd Qu.:-0.5767              3rd Qu.:-0.2174       
##  Max.   : 0.2502              Max.   : 0.5370       
##  meanoffreqBodyAccmeanY meanoffreqBodyAccmeanZ meanoffreqBodyAccstdX
##  Min.   :-0.98903       Min.   :-0.9895        Min.   :-0.9966      
##  1st Qu.:-0.95361       1st Qu.:-0.9619        1st Qu.:-0.9820      
##  Median :-0.59498       Median :-0.7236        Median :-0.7470      
##  Mean   :-0.48873       Mean   :-0.6297        Mean   :-0.5522      
##  3rd Qu.:-0.06341       3rd Qu.:-0.3183        3rd Qu.:-0.1966      
##  Max.   : 0.52419       Max.   : 0.2807        Max.   : 0.6585      
##  meanoffreqBodyAccstdY meanoffreqBodyAccstdZ meanoffreqBodyAccJerkmeanX
##  Min.   :-0.99068      Min.   :-0.9872       Min.   :-0.9946           
##  1st Qu.:-0.94042      1st Qu.:-0.9459       1st Qu.:-0.9828           
##  Median :-0.51338      Median :-0.6441       Median :-0.8126           
##  Mean   :-0.48148      Mean   :-0.5824       Mean   :-0.6139           
##  3rd Qu.:-0.07913      3rd Qu.:-0.2655       3rd Qu.:-0.2820           
##  Max.   : 0.56019      Max.   : 0.6871       Max.   : 0.4743           
##  meanoffreqBodyAccJerkmeanY meanoffreqBodyAccJerkmeanZ
##  Min.   :-0.9894            Min.   :-0.9920           
##  1st Qu.:-0.9725            1st Qu.:-0.9796           
##  Median :-0.7817            Median :-0.8707           
##  Mean   :-0.5882            Mean   :-0.7144           
##  3rd Qu.:-0.1963            3rd Qu.:-0.4697           
##  Max.   : 0.2767            Max.   : 0.1578           
##  meanoffreqBodyAccJerkstdX meanoffreqBodyAccJerkstdY
##  Min.   :-0.9951           Min.   :-0.9905          
##  1st Qu.:-0.9847           1st Qu.:-0.9737          
##  Median :-0.8254           Median :-0.7852          
##  Mean   :-0.6121           Mean   :-0.5707          
##  3rd Qu.:-0.2475           3rd Qu.:-0.1685          
##  Max.   : 0.4768           Max.   : 0.3498          
##  meanoffreqBodyAccJerkstdZ meanoffreqBodyGyromeanX meanoffreqBodyGyromeanY
##  Min.   :-0.993108         Min.   :-0.9931         Min.   :-0.9940        
##  1st Qu.:-0.983747         1st Qu.:-0.9697         1st Qu.:-0.9700        
##  Median :-0.895121         Median :-0.7300         Median :-0.8141        
##  Mean   :-0.756489         Mean   :-0.6367         Mean   :-0.6767        
##  3rd Qu.:-0.543787         3rd Qu.:-0.3387         3rd Qu.:-0.4458        
##  Max.   :-0.006236         Max.   : 0.4750         Max.   : 0.3288        
##  meanoffreqBodyGyromeanZ meanoffreqBodyGyrostdX meanoffreqBodyGyrostdY
##  Min.   :-0.9860         Min.   :-0.9947        Min.   :-0.9944       
##  1st Qu.:-0.9624         1st Qu.:-0.9750        1st Qu.:-0.9602       
##  Median :-0.7909         Median :-0.8086        Median :-0.7964       
##  Mean   :-0.6044         Mean   :-0.7110        Mean   :-0.6454       
##  3rd Qu.:-0.2635         3rd Qu.:-0.4813        3rd Qu.:-0.4154       
##  Max.   : 0.4924         Max.   : 0.1966        Max.   : 0.6462       
##  meanoffreqBodyGyrostdZ meanoffreqBodyAccMagmean meanoffreqBodyAccMagstd
##  Min.   :-0.9867        Min.   :-0.9868          Min.   :-0.9876        
##  1st Qu.:-0.9643        1st Qu.:-0.9560          1st Qu.:-0.9452        
##  Median :-0.8224        Median :-0.6703          Median :-0.6513        
##  Mean   :-0.6577        Mean   :-0.5365          Mean   :-0.6210        
##  3rd Qu.:-0.3916        3rd Qu.:-0.1622          3rd Qu.:-0.3654        
##  Max.   : 0.5225        Max.   : 0.5866          Max.   : 0.1787        
##  meanoffreqBodyAccJerkMagmean meanoffreqBodyAccJerkMagstd
##  Min.   :-0.9940              Min.   :-0.9944            
##  1st Qu.:-0.9770              1st Qu.:-0.9752            
##  Median :-0.7940              Median :-0.8126            
##  Mean   :-0.5756              Mean   :-0.5992            
##  3rd Qu.:-0.1872              3rd Qu.:-0.2668            
##  Max.   : 0.5384              Max.   : 0.3163            
##  meanoffreqBodyGyroMagmean meanoffreqBodyGyroMagstd
##  Min.   :-0.9865           Min.   :-0.9815         
##  1st Qu.:-0.9616           1st Qu.:-0.9488         
##  Median :-0.7657           Median :-0.7727         
##  Mean   :-0.6671           Mean   :-0.6723         
##  3rd Qu.:-0.4087           3rd Qu.:-0.4277         
##  Max.   : 0.2040           Max.   : 0.2367         
##  meanoffreqBodyGyroJerkMagmean meanoffreqBodyGyroJerkMagstd  meanofClasse
##  Min.   :-0.9976               Min.   :-0.9976              Min.   :1.0  
##  1st Qu.:-0.9813               1st Qu.:-0.9802              1st Qu.:2.0  
##  Median :-0.8779               Median :-0.8941              Median :3.5  
##  Mean   :-0.7564               Mean   :-0.7715              Mean   :3.5  
##  3rd Qu.:-0.5831               3rd Qu.:-0.6081              3rd Qu.:5.0  
##  Max.   : 0.1466               Max.   : 0.2878              Max.   :6.0
```

```r
#Variables
print(colnames(tidy))
```

```
##  [1] "meanofSubject"                 "meanofActivity"               
##  [3] "meanoftimeBodyAccmeanX"        "meanoftimeBodyAccmeanY"       
##  [5] "meanoftimeBodyAccmeanZ"        "meanoftimeBodyAccstdX"        
##  [7] "meanoftimeBodyAccstdY"         "meanoftimeBodyAccstdZ"        
##  [9] "meanoftimeGravityAccmeanX"     "meanoftimeGravityAccmeanY"    
## [11] "meanoftimeGravityAccmeanZ"     "meanoftimeGravityAccstdX"     
## [13] "meanoftimeGravityAccstdY"      "meanoftimeGravityAccstdZ"     
## [15] "meanoftimeBodyAccJerkmeanX"    "meanoftimeBodyAccJerkmeanY"   
## [17] "meanoftimeBodyAccJerkmeanZ"    "meanoftimeBodyAccJerkstdX"    
## [19] "meanoftimeBodyAccJerkstdY"     "meanoftimeBodyAccJerkstdZ"    
## [21] "meanoftimeBodyGyromeanX"       "meanoftimeBodyGyromeanY"      
## [23] "meanoftimeBodyGyromeanZ"       "meanoftimeBodyGyrostdX"       
## [25] "meanoftimeBodyGyrostdY"        "meanoftimeBodyGyrostdZ"       
## [27] "meanoftimeBodyGyroJerkmeanX"   "meanoftimeBodyGyroJerkmeanY"  
## [29] "meanoftimeBodyGyroJerkmeanZ"   "meanoftimeBodyGyroJerkstdX"   
## [31] "meanoftimeBodyGyroJerkstdY"    "meanoftimeBodyGyroJerkstdZ"   
## [33] "meanoftimeBodyAccMagmean"      "meanoftimeBodyAccMagstd"      
## [35] "meanoftimeGravityAccMagmean"   "meanoftimeGravityAccMagstd"   
## [37] "meanoftimeBodyAccJerkMagmean"  "meanoftimeBodyAccJerkMagstd"  
## [39] "meanoftimeBodyGyroMagmean"     "meanoftimeBodyGyroMagstd"     
## [41] "meanoftimeBodyGyroJerkMagmean" "meanoftimeBodyGyroJerkMagstd" 
## [43] "meanoffreqBodyAccmeanX"        "meanoffreqBodyAccmeanY"       
## [45] "meanoffreqBodyAccmeanZ"        "meanoffreqBodyAccstdX"        
## [47] "meanoffreqBodyAccstdY"         "meanoffreqBodyAccstdZ"        
## [49] "meanoffreqBodyAccJerkmeanX"    "meanoffreqBodyAccJerkmeanY"   
## [51] "meanoffreqBodyAccJerkmeanZ"    "meanoffreqBodyAccJerkstdX"    
## [53] "meanoffreqBodyAccJerkstdY"     "meanoffreqBodyAccJerkstdZ"    
## [55] "meanoffreqBodyGyromeanX"       "meanoffreqBodyGyromeanY"      
## [57] "meanoffreqBodyGyromeanZ"       "meanoffreqBodyGyrostdX"       
## [59] "meanoffreqBodyGyrostdY"        "meanoffreqBodyGyrostdZ"       
## [61] "meanoffreqBodyAccMagmean"      "meanoffreqBodyAccMagstd"      
## [63] "meanoffreqBodyAccJerkMagmean"  "meanoffreqBodyAccJerkMagstd"  
## [65] "meanoffreqBodyGyroMagmean"     "meanoffreqBodyGyroMagstd"     
## [67] "meanoffreqBodyGyroJerkMagmean" "meanoffreqBodyGyroJerkMagstd" 
## [69] "meanofClasse"
```
