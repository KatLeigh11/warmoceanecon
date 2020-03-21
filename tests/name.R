# ---------------------------------
# Testing for functions
# ---------------------------------
# to test function: file_test("test/name.R")

# ---------------------------------
# function 1: max temperatures
# --------------------------------

test_that("max_temperatures_works!",{
  # --------------------------------

  expect_true(max_1 >= mean(temps)) #1st test that checks if the max temperature is greater than or equal to the mean temperature
  # --------------------------------

  expect_equal(length(locs), length(loc_sizes)) #2nd test that makes sure the length of locations matches with the length of location sizes
  # --------------------------------

  expect_true(max_1 >= max_2) #3rd test that makes sure the warmest temperature is greater than or equal to the second highest temperature
})

# --------------------------------
# function 2: economic scores
# --------------------------------

test_that("econ_scores_works!", {
# -------------------------------

  #first data set with locations and new economic scores of only 1 and 2
  econ_low <- data.frame("Location" = locs, "Damages_USD" = c(1,2,1,2,1,2,1,2,1,2))
  #second data set with locations and new economic scores of only 4 and 5
  econ_high <- data.frame("Location" = locs, "Damages_USD" = c(4,5,4,5,4,5,4,5,4,5))
# --------------------------------

    expect_true( #1st test that makes sure the highest damages is greater than the second highest damages
    unlist(damage_per_loc(data.frame("Location" = names_temp_1), data.frame("Location" = names_temp_2), econ_low))[41] >
      unlist(damage_per_loc(data.frame("Location" = names_temp_1), data.frame("Location" = names_temp_2), econ_high))[41])
# ----------------------------------

  expect_length(
    unlist(damage_per_loc(data.frame("Location" = names_temp_1), data.frame("Location" = names_temp_2), econ_low))[41],1)
# -----------------------------------

  # new data frame with first set of locations
  temp1_1s <- data.frame("Location" = c("Arroya Quemado", "Carpinteria", "Hermosa", "Malibu", "Long Beach"))
  # data frame with second set of locations
  temp2_1s <- data.frame("Location" = c("Isla Vista", "Mohawk", "Naples", "Ventura", "Santa Monica"))
  # economic scores for both new location data frames
  econ_scores_all_1s <- data.frame("Location" = locs, "Damages_USD" = c(1,1,1,1,1,1,1,1,1,1))
# -----------------------------------

  expect_equal(as.data.frame(damage_per_loc(temp1_1s, temp2_1s, econ_scores_all_1s)[1])[[2]],
               as.data.frame(damage_per_loc(temp1_1s, temp2_1s, econ_scores_all_1s)[2])[[2]])# 3rd test to show that an economic score of 1 in the first data set is equal to an economic score of 1 in the second data set

})




