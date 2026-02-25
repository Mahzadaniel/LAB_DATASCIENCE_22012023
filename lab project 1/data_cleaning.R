library(tidyverse)

data <- read.csv("C:\\Users\\User\\OneDrive\\Documents\\LAB_DATA_SCIENCE_22012023\\lab project 1\\unclean_dataset.csv", encoding="latin1")
head(data)
str(data)
clean_data <- data [!duplicated(data),]
clean_data <- clean_data %>%
  separate(Student_ID,into = c("Student_ID","First_Name","Last_Name","Age",
                    "Gender","Course","Enrollment_Date","Total_Payments"),
           sep = "\\|")
clean_data <- subset(clean_data, select = -Student_ID)

clean_data$First_Name <- trimws(clean_data$First_Name)
clean_data$Last_Name <- trimws(clean_data$Last_Name)
clean_data$Course <- trimws(clean_data$Course)




clean_data <- clean_data %>%distinct()


clean_data$Age <- as.numeric(clean_data$Age)
clean_data$Total_Payments <- parse_number(clean_data$Total_Payments)
clean_data$Enrollment_Date <- as.Date(clean_data$Enrollment_Date)

clean_data <- clean_data[!duplicated(clean_data[, c("First_Name", "Last_Name")]), ]

clean_data <- clean_data[!duplicated(clean_data[c("First_Name", "Last_Name")]), ]


clean_data$Age[is.na(clean_data$Age)] <- mean(clean_data$Age, na.rm = TRUE)

clean_data$Gender <- toupper(clean_data$Gender)
clean_data$Gender[clean_data$Gender == "MALE"] <- "M"
clean_data$Gender[clean_data$Gender == "FEMALE"] <- "F"

clean_data <- clean_data %>%
  # 1. Remove rows where the Course is missing (NA) or completely empty
  filter(!is.na(Course) & Course != "") %>%
  
  
  mutate(
    Course = case_when(
      # If it contains "Machine", change it to the correct full spelling
      str_detect(Course, "(?i)Machine") ~ "Machine Learning",
      
      # If it contains "Data S", change it to Data Science
      str_detect(Course, "(?i)Data S")  ~ "Data Science",
      
      
      # If it contains "Web", change it to Web Development
      str_detect(Course, "(?i)Web")     ~ "Web Development",
      
      
      TRUE ~ Course 
    )
  )


clean_data <- na.omit(clean_data)

summary(clean_data)
str(clean_data)
head(clean_data)


