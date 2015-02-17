setwd("Article_Piketty_et_al/data") # adjust path

library(foreign)

  # load data
US.data = read.dta("US analysis/usdata.dta")
US.data = subset(US.data, year <= 2008)
names(US.data)[names(US.data) == "top1per1"] = "top1perc_nok"

attach(US.data)
US.data = cbind(US.data, "incadulttop1" = (top1perc / 0.01) * (cpi * totinc_k / adults20))
US.data = cbind(US.data, "incadultbot99" = ((1 - top1perc) / 0.99) * (cpi * totinc_k / adults20))
US.data = cbind(US.data, "incadult_nok" = cpi * totinc_n / adults20)
US.data = cbind(US.data, "incadulttop1_nok" = (top1perc_nok / 0.01) * (cpi * totinc_n / adults20))
US.data = cbind(US.data, "incadultbot99_nok" = ((1 - top1perc_nok) / 0.99) * (cpi*totinc_n / adults20))
detach(US.data)

  # now use US.data$ because new columns are not in the attached data
US.data = cbind(US.data, "incadulttop1_n" = 100 * US.data$incadulttop1 / US.data$incadulttop1[1])
US.data = cbind(US.data, "incadultbot99_n"= 100 * US.data$incadultbot99 / US.data$incadultbot99[1])

  # delete the columns which aren't used in the problem set
US.data$totinc_k = NULL
US.data$totinc_n = NULL
US.data$cpi = NULL
US.data$taxunits = NULL
US.data$adults20 = NULL
US.data$incadulttop1 = NULL
US.data$incadultbot99 = NULL
US.data$gdp = NULL

  # save as csv file for the problem set
write.table(US.data, file="usdata.csv")
