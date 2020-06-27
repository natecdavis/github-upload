library("readxl")
forp <- read_excel("nba_multisport_dataset.xlsx")
scatter.smooth(x=forp$Pick,y=forp$FORP_adj)

# forp$log_forp_adj <- log(forp$FORP_adj)

# lm(FORP ~ Pick, data=forp)

us_forp <- forp[which(forp$non_us==0),]

base <- lm(forp ~  log(pick) + pick + wiki + maxpreps + athletic_net + multisport + years
           + football + baseball + volleyball + tennis + track + soccer, us_forp)

base <- lm(forp_adj ~ log(pick) + non_us, forp)

summary(base)

fit <- step(base)

summary(fit)

