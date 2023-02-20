library(tidyverse)
library(ds4ling)
#
# tidyr
#
test_scores_rm
test_scores_rm %>%
  #separate elements of variable with separate()
  separate(col=id,
           into=c("lang", "trash"),
           sep = 4,
           remove=FALSE) %>% #sep is the separator; either specify number of characters or a delimiter like _
  #remove=FALSE keeps initial unitidy column
  select(-trash) %>% #select everything but trash; "take out trash"
  separate(col=spec,
           into=c("group", "prof"),
           sep="_") #separates spec column
#unite: the opposite of separate, uses same args
#pivot_longer(): used to be known as gather(), but it changes dataframes from wide to long
#useful for when one variable has two obsevations (e.g., two test scores)
scores_long <- test_scores_rm %>%
  pivot_longer(cols = c("test1", "test2"),
               names_to = "test",
               values_to = "score"
              )

scores_long

scores_long%>%
  ggplot()
  aes(x=)

scores_wide <- scores_long%>%
  pivot_wider(cols = c())

#can also pivot multiple variables at the same time


#fit a model with lm function
mod1 <- lm(mpg ~ wt, data=mtcars) #mpg~wt is formula, data is mtcars
summary(mod1) #summary gives us more than just calling lm does