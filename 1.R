data1=read.csv('EMDAT.csv')
library(dplyr)
data=data1 %>%
  dplyr::select("Year","Entity","deaths_all_disasters", "injured_all_disasters", "homeless_all_disasters")
data=data %>% 
  rename(Deaths = deaths_all_disasters)%>%
  rename(Injured = injured_all_disasters)%>%
  rename(Homeless = homeless_all_disasters)
data = data[complete.cases(data),]

top_10_deaths = data %>%
  select("Year","Entity","Deaths")%>%
  arrange(-Deaths)%>%
  slice(1:10)
top_10_injured = data %>%
  select("Year","Entity","Injured")%>%
  arrange(-Injured)%>%
  slice(1:10)
top_10_homeless = data %>%
  select("Year","Entity","Homeless")%>%
  arrange(-Homeless)%>%
  slice(1:10)

Years=data%>%
  select("Year","Deaths")
Years=Years%>%
  mutate(Year=as.character(Year))%>%
  group_by(Years$Year)
Years_Sum= Years %>%
  summarize(Sum_Value = sum(Deaths))
Years_Sum=Years_Sum %>%
  mutate(bigger_or_smaller_than_500=(ifelse (Sum_Value>500, 1, 0)))
  


  