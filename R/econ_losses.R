#' @title  Economic impact of temperature
#' @description This function returns the economic damages associated with temp 1 and temp 2 per location, as well as the total economic losses associated with both temperatures across all locations.
#' @param temp_1_locs: a list of locations experiencing temp #1.
#' @param temp_2_locs: a list of locations experiencing temp #2.
#' @param econ_scores: a dataframe containing columns for each location ('Location') and their associated economic scores ("Scores') from 1 to 5.
#' @param df_temps1: a dataframe containing the locations experiencing temp #1 and their associated economic losses.
#' @param df_temps2: a dataframe containing the locations experiencing temp #2 and their associated economic losses.
#' @param tot_damage: total economic losses across all locations due to both temperatures.
#' @note Economic scores represent damage brackets (in USD) as defined below...
#' 1 =  $1,400,000
#' 2 = $7,100,000
#' 3 = $30,000,000
#' 4 = $44,000,000
#' 5 = $600,000,000.


damage_per_loc <- function(temp_1_locs, temp_2_locs, econ_scores){

  # create dataframe for temps1 and temps2 w/ economic scores associated

  df_temps1 <- full_join(temp_1_locs, econ_scores) %>%
    drop_na()
  df_temps2 <- full_join(temp_2_locs, econ_scores,) %>%
    drop_na()

  # replace scores w/ damage values in both dataframes

  df_temps1$Damages_USD[df_temps1$Damages_USD == 1] <- 1400000
  df_temps1$Damages_USD[df_temps1$Damages_USD == 2] <- 7100000
  df_temps1$Damages_USD[df_temps1$Damages_USD == 3] <- 30000000
  df_temps1$Damages_USD[df_temps1$Damages_USD == 4] <- 44000000
  df_temps1$Damages_USD[df_temps1$Damages_USD == 5] <- 600000000

  df_temps2$Damages_USD[df_temps1$Damages_USD == 1] <- 1400000
  df_temps2$Damages_USD[df_temps1$Damages_USD == 2] <- 7100000
  df_temps2$Damages_USD[df_temps1$Damages_USD == 3] <- 30000000
  df_temps2$Damages_USD[df_temps1$Damages_USD == 4] <- 44000000
  df_temps2$Damages_USD[df_temps1$Damages_USD == 5] <- 600000000

  # sum all losses across both locations

  tot_damage <- sum(df_temps1$Damages_USD)+sum(df_temps2$Damages_USD)

  # return the desired outputs

  return(list("Economic losses for locations experiencing temp 1" = df_temps1, "Economic losses for locations experiencing temp 2" = df_temps2, "Total economic damages for all locations" = tot_damage))

}
