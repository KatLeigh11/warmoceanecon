# ideas for ass3_262

# Maximum water temp across locations
#   Inputs: list of temperatures at different locations, list of locations, list of size of each location (in km)
#   Outputs: top 2 water temps, names of locations experiencing temp #1, total number kms experiencing temp #1, names of locations experiencing temp #2, total number kms experiencing temp #2

library(tidyverse)

Max_2_temps <- function(temps, locs, loc_sizes) {
  df_raw %>%
    mutate(locs = as.factor(locs))

  max_1 = max(temps)
  max_2 = sort(temps, T)[3]

  names_temp_1 = locs[which(temps == max_1)]
  names_temp_2 = locs[which(temps == max_2)]
  temp_1_sizes = loc_sizes[which(temps == max_1)]
  temp_2_sizes = loc_sizes[which(temps == max_2)]

  total_size_top = sum(temp_1_sizes)
  total_size_2nd = sum(temp_2_sizes)

  temp_1_locs <- data.frame("Location" = names_temp_1, "Max_Temperature" = max_1, "Size_km" = temp_1_sizes)
  temp_2_locs<- data.frame("Location" = names_temp_2, "Max_Temperature" = max_2, "Size_km" = temp_2_sizes)


  return(list("Top 2 Water Temperatures" = c(max_1, max_2), "All Locations experiencing warmest temperature" = names_temp_1, "All locations experiencing 2nd warmest temperature" = names_temp_2, "Total kilometers for locations experiencing the warmest temperature" = temp_1_sizes, "Total kilometers for locations experiencing the 2nd warmest temperature" =  temp_2_sizes, "Sum of kilometers for locations with highest temperature" = total_size_top, "Sum of kilometers for locations with 2nd highest temperature" = total_size_2nd, "dataframe1" = temp_1_locs, "dataframe2" = temp_2_locs))

}

#maxs = order(temps, decreasing=TRUE)[1:2]
# names_temp_1 <- df_raw %>%
#   filter(temps == maxs[1]) %>%
#   pull(locs)

# temp_1_sizes <- df_raw %>%
#   filter(temps == maxs[1]) %>%
#   summarize(sum = sum(loc_sizes))

# names_temp_2 <- df_raw %>%
#   filter(temps == maxs[2]) %>%
#   select(locs)
#
# temp_2_sizes <- df_raw %>%
#   filter(temps == maxs[2]) %>%
#   summarize(sum = sum(loc_sizes))

#  return(list("Top 2 Water Temperatures" = maxs, "Locations experiencing warmest temperature" = temp_1_sizes, "Total kilometers experiencing the warmest temperature" = temp_1_sizes, "Locations experiencing second-warmest temperature" = temp_2_sizes, "Total kilometers experiencing the second-warmest temperature" = temp_2_sizes))
