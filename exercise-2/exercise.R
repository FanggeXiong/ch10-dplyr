### Exercise 2: Data Frame Practice with dplyr

## This exercise need the "fueleconomy" package.  Install and load it.
## You should have have access to the `vehicles` data.frame
install.packages("fueleconomy")
library("fueleconomy")
## Install (if you haven't already) and load the `dplyr`package
library("dplyr")
# You should have have access to the `vehicles` data.frame
View(vehicles)


# Create a data.frame of vehicles from 1997
car_1997 <- filter(vehicles, year == 1997)
car_1997
# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(car_1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
new_car <- filter(vehicles, drive == "2-Wheel Drive" & cty > 20)
View(new_car)
# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst_car <- filter(new_car, hwy == min(hwy)) %>%
  select(id)
worst_car

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
best_vehicles <- function(selected_year, selected_make) {
  cars <- filter(vehicles, year == selected_year & make == selected_make) %>%
    filter(hwy == max(hwy))
  return(cars)
}

# What was the most efficient honda model of 1995?
best_vehicles(1995, "honda")

