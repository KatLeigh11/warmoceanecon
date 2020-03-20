# ---------------------------------
# Testing for functions
# ---------------------------------

# ---------------------------------
# function 1: max temperatures
# --------------------------------
test_that("max_temperatures_works!",
          expect_true(Max_2_temps(temps, locs, loc_sizes)$max_1 >= mean(temps))
          expect_equal(length(locs), length(loc_sizes))
          expect_true(Max_2_temps(temps, locs, loc_sizes)$max_1 >= Max_2_temps(temps, locs, loc_sizes)$max_2))

# --------------------------------
# function 2: economic scores
# --------------------------------

test_that("econ_scores_works!",
          econ_low <- data.frame(locs, c(1,2,1,2,1,2,1,2,1,2))
          econ_high <- data,frame(locs, c(4,5,4,5,4,5,4,5,4,5))
          expect_true(damage_per_loc(temp_1_locs, temp_2_locs, econ_low)>damage_per_loc(temp_1_locs, temp_2_locs, econ_high))

          expect_length(damage_per_loc(temp_1_locs, temp_2_locs, econ_low), 1)

          expect_null(damage_per_loc(temp_1_locs, temp_2_locs, 0))

)
