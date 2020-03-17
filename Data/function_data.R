# --------------------------------
#creating the data
# --------------------------------

# --------------------------------
#creating the lists of each variable
# --------------------------------

#temperatures vector
temps <- c(25, 30, 32, 18, 26, 32, 25, 17, 30, 28)

#CA location vector
locs <- c("Arroya Quemado", "Carpinteria", "Isla Vista", "Mohawk", "Naples", "Hermosa","Malibu", "Ventura", "Santa Monica", "Long Beach")

#location size (km) vector
loc_sizes <- c(100, 150, 200, 250, 300, 100, 125, 250, 325, 200)

#economic scores vector
Scores <- c(2, 3, 5, 1, 4, 3, 2, 1, 5, 4)

#population size vector
population <- c(104360, 103890, 100560, 103274, 105320, 102739, 103330, 109409, 102934, 120001)

#----------------------------
# creating the 3 data frames
# --------------------------

#initial data frame containing location, temperatures, and location size for function 1 (max_water_temp)
df_raw <- data.frame(locs, temps, loc_sizes)

#data frame for function 2(econ_losses) that contains the corresponding economic scores per location
econ_scores <- data.frame("Location" = locs, "Damages_USD" = Scores)

#data frame for function 3(per_cap_per_km_losses) that contains the corresponding population size per location and the size of the location (km)
pops_sizes <- data.frame("Location" = locs, "Size_km" = loc_sizes, "Population" = population)




