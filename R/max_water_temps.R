#' @title  Top two warmest water temperatures across locations
#' @description This function returns the top two temperatures experienced within a given set of locations, a list of the locations experiencing these two temperatures, and the total geographic area experiencing these two temperatures in km.
#' @param df_raw: a dataframe with columns for locations ('locs'), temperatures ('temps'), sizes of each location in km ('loc_sizes')
#' @return The warmest and second warmest temperatures, a list of all the locations experiencing the warmest and 2nd warmest temperatures, the associated sizes with each locaton, and the total area experiencing the warmest temperature and the 2nd warmest temperature.

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

