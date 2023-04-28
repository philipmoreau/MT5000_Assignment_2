install.packages("tidyverse")
install.packages("maps")

unicef_indicator_1 <- read.csv("unicef_indicator_1.csv") 
map_world <- map_data("world")
unicef_2016 <- unicef_indicator_1 %>%
  filter(time_period == 2016, obs_value > 0) %>% select(country, obs_value)
map_obs_2016 <- full_join(map_world, unicef_2016, by = c("region" = "country"))
ggplot(data = map_obs_2016) + 
  aes(x = long, y = lat, group = group, fill = obs_value, color = obs_value) +
  geom_polygon() + 
  scale_fill_gradient(low = "lightblue", high = "red")
  labs(title = "Worldwide OBS Value", x = "", y = "") +
  theme_classic()
