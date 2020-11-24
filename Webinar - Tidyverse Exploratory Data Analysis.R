#### Webinar: Tidyverse Exploratory Data Analysis ####
## Link: https://www.youtube.com/watch?v=uG3igAGX7UE

## Tidyverse - How to approach EDA? ##

## 2017 - The State of Data Science = data set ##

# Option 1
multiple_choice_response_base <- read.csv("data_analyst_role/EDA/EDA---R/multipleChoiceResponses.csv")


library(tidyverse)

# Look for missing data
multiple_choice_response_base %>%
  summarize(number_nas = sum(is.na(Country)))

multiple_choice_response_base %>%
  purrr::map_df(~sum(is.na(.)))

multiple_choice_response_base %>%
  count(StudentStatus)

## na_if to change empty strings into na
multiple_choice_response_base <- multiple_choice_response_base %>%
  na_if("")

# Option 2: Using the %<>% reassignment pipe
multiple_choice_response_base %<>%
  na_if("")


# Method 2 to import a data using readr
multiple_choice_responses <- readr::read_csv('data_analyst_role/EDA/EDA---R/multipleChoiceResponses.csv',
                                             guess_max = nrow(multiple_choice_responses))

#problems(multiple_choice_response_base)

colnames(multiple_choice_responses)
head(multiple_choice_responses)


multiple_choice_responses %>%
  select_if(is.numeric) %>%
  skimr::skim()

# adding tidyr to reshape data
multiple_choice_responses %>%
  purrr::map_df(~ n_distinct(.)) %>%
  tidyr::gather(question, num_distinct_answers) %>%
  arrange(desc(num_distinct_answers))

# Using the count function
multiple_choice_responses %>%
  count(WorkMethodsSelect, sort = TRUE)

# separate the data with multiple options
multiple_choice_responses %>%
  select(WorkMethodsSelect) %>%
  filter(!is.na(WorkMethodsSelect)) %>%
  mutate(work_method = str_split(WorkMethodsSelect, ","))

# Unnest the data
unnested_work_methods <- multiple_choice_responses %>%
  select(WorkMethodsSelect) %>%
  filter(!is.na(WorkMethodsSelect)) %>%
  mutate(work_method = str_split(WorkMethodsSelect, ",")) %>%
  unnest(work_method) %>%
  select(work_method)


# Method 2 as above - separate rows function
unnested_work_methods <- multiple_choice_responses %>%
  select(WorkMethodsSelect) %>%
  filter(!is.na(WorkMethodsSelect)) %>%
  # sepearte columns into rows based on what you select
  separate_rows(WorkMethodsSelect, sep = ",")


method_freq <- unnested_work_methods %>%
  count(work_method, sort = TRUE)

method_freq

# graph the data
unnested_work_methods %>%
  count(work_method) %>%
  ggplot(aes(x = fct_reorder(work_method, n), y = n)) +
  geom_col() + 
  coord_flip()


# Select all the columns that contains "WorkChallengeFrequency"
WorkChallenges <- multiple_choice_responses %>%
  select(contains("WorkChallengeFrequency")) %>%
  gather(question, response) %>%
  filter(!is.na(response)) %>%
  mutate(question = stringr::str_remove(question, "WorkChallengeFrequency"))

WorkChallenges %>%
  count(response)

perc_problem_work_challenge <-WorkChallenges %>%
  mutate(response = if_else(response %in% c("Most of the time", "Often"), 1, 0)) %>%
  group_by(question) %>%
  summarise(perc_problem = mean(response))

ggplot(perc_problem_work_challenge, aes(x = fct_reorder(question, perc_problem),y = perc_problem)) +
  geom_point() +
  coord_flip() +
  scale_y_continuous(labels = scales::percent) +
  labs(x = "Question", y = "Percentage Encountering Problem Frequently")



# Problem SOlution Options: tribble() package
# use reprex() to find any problems and submit questions 

