setwd("Article_Piketty_et_al/data") # adjust path

library(foreign)

  # prepare data:
Int.data = read.dta("International analysis/AllCountries_update_pre75.dta")

  # delete the columns which aren't needed for the problem set
Int.data$payroll_employee = NULL
Int.data$payroll_employer = NULL
Int.data$vat = NULL
Int.data$gdpemp = NULL
Int.data$gdphour = NULL
Int.data$gdp_wtid = NULL
Int.data$adults_old = NULL
Int.data$employees = NULL
Int.data$hours = NULL
Int.data$employees_ilo = NULL
Int.data$hours_ilo = NULL
Int.data$adults = NULL
Int.data$countrynum = NULL

Int.data = subset(Int.data, year >= 1960 & year <= 2010)
row.names(Int.data) = NULL

  # data preparation inherited from Piketty et al. (translated into R)
Int.data$tax_other[is.na(Int.data$tax_other)] = 0
Int.data$tax_other[with(Int.data, country == "Finland" & tax_other == 0)] = 0.154
Int.data=cbind(Int.data, "retention" = (1 - Int.data$inctax))
attach(Int.data)
Int.data$retention = replace(Int.data$retention, country=="United States" | country == "France", 
                             (1 - inctax[country == "United States" | country == "France"]) * (1 - tax_other[country == "United States" | country == "France"]))
Int.data$retention = replace(Int.data$retention, country == "Finland" | country == "Japan", 
                           (1 - inctax[country == "Finland" | country == "Japan"] - tax_other[country == "Finland" | country == "Japan"]))
detach(Int.data)

Int.data$mtr = 1 - Int.data$retention
Int.data$mtr[with(Int.data, country == "Japan" & mtr >= 0.8 & year <= 1984)] = 0.8
Int.data$mtr[with(Int.data, country == "Japan" & mtr >= 0.78 & year  > 1984 & year <= 1987)] = 0.78
Int.data$mtr = replace(Int.data$mtr, Int.data$country == "Canada", Int.data$mtr[Int.data$country == "Canada"])

  # delete the remaining columns which aren't needed for the problem set
Int.data$retention = NULL
Int.data$inctax = NULL
Int.data$tax_other = NULL

  # save the data as a .dta file
write.dta(Int.data, file="intdata.dta")