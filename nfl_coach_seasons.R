library("readxl")
coach_seasons <- read_excel("nfl_coach_seasons.xlsm")
#scatter.smooth(x=forp$Pick,y=forp$FORP_adj)

#forp$log_forp_adj <- log(forp$FORP_adj)

# lm(FORP ~ Pick, data=forp)

full_coach_seasons <- coach_seasons[which(coach_seasons$games==16),]

base <- lm(wins ~ . - id - team - games, full_coach_seasons)

base <- lm(forp_adj ~ log(pick) + non_us, forp)

summary(base)

fit <- step(base)

summary(fit)
