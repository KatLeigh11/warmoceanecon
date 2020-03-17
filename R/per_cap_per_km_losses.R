#' @title Per km and per capita economic impacts of temperature
#' @author Kat Leigh & Anna Ableman
#' @description This function provides the per km economic losses for a list of locations associated with two temperatures.
#' @param df_temps1: A dataframe with columns for economic losses ("Scores") and locations ("Location") for temp 1
#' @param pops_sizes: A dataframe with columns for population sizes ("population"), location sizes in km ("km"), and locations ("Location").
#' @param df_temps2: A dataframe with columns for economic losses ("Scores") and locations ("Location") for temp 2.
#' @return One dataframe for temp 1 and another for temp 2, each with columns for locations and the per capita economic losses for each location. Also, the per km economic losses due to temp #1, and the per km economic losses due to temp #2.

temp_damages_km_cap <- function(df_temps1, df_temps2, pops_sizes){

  # create dataframes that contain locations, losses, populations, and sizes for each temperature

  df_temp1_all <- full_join(df_temps1, pops_sizes) %>%
    drop_na()
  df_temp2_all <- full_join(df_temps2, pops_sizes) %>%
    drop_na()

  # create per capita losses column for each temperature

  df_temp1_per_cap <- df_temp1_all %>%
    mutate("Per_capita_loss" = df_temp1_all$Damages_USD/df_temp1_all$Population)

  df_temp2_per_cap <- df_temp2_all %>%
    mutate("Per_capita_loss" = df_temp2_all$Damages_USD/df_temp2_all$Population)

  # find the per km losses for temp 1 and temp 2

  loss_km_temp1 <- sum(df_temp1_all$Damages_USD)/sum(df_temp1_all$Size_km)
  loss_km_temp2 <- sum(df_temp2_all$Damages_USD)/sum(df_temp2_all$Size_km)

  # return desired outputs

  return(list("Locations experiencing temp 1" = df_temp1_per_cap$Location, "Per capita economic losses for each location experiencing temp 1" = df_temp1_per_cap$Per_capita_loss, "Locations experiencing temp 1" = df_temp1_per_cap$Location, "Per capita economic losses for each location experiencing temp 1" = df_temp1_per_cap$Per_capita_loss, "Per km economic losses due to temp 1" = loss_km_temp1, "Per km economic losses due to temp 2" = loss_km_temp2))

}
