#install.packages("zoo")
library(zoo)

data <- read.table("BTCvsSP500.csv", header = T, sep = ",")

t = data[,2]
t = as.Date(t)
btc = data[,3]
sp = data[,4]

scaled_btc = btc / btc[1]
scaled_sp = sp / sp[1]

plot(t, scaled_btc, type = "l")
lines(t, scaled_sp)

plot(t, btc, type = "l")
lines(t, sp)

fwd_btc = list()
fwd_sp = list()

offset = 20

for(i in 1:(1259 - offset)){
  fwd_btc[[i]] = btc[i + offset] - btc[i]
  fwd_sp[[i]] = sp[i + offset] - sp[i]
}

plot(t[seq(1,1259 - offset)], fwd_btc, type = "l", axes = T, frame.plot = F)
lines(t[seq(1,1259 - offset)], fwd_sp)


sc_btc = btc / btc

end = seq(0,1248)

t_end = as.Date(t[end])

plot(t_end, btc[end], type = "l", col = "blue", frame.plot = F, xlab = "Time", ylab = "Bitcoin price ($)", main = "Bitcoin price compared to S&P 500 index")
axis(2)
par(new = T)
plot(t_end, sp[end], axes = F, type = "l", ylab = "", xlab = "", col = "red")
axis(4)
mtext(4, text = "S&P 500 Index", line = 2)
legend( "topleft", legend = c("Bitcoin", "SP500"), col = c("blue", "red"), lwd = 2)


plot(t[end], btc[end], axes=F, ylim=c(0,max(pop)), xlab="", ylab="",type="l",col="black", main="",xlim=c(t[end][1],t[end][160]))
points(t[end], btc[end],pch=20,col="black")
axis(2, ylim=c(0,max(btc[end])),col="black",lwd=2)
mtext(2,text="Bitcoin price",line=2)

par(new=T)
plot(time, med, axes=F, ylim=c(0,max(med)), xlab="", ylab="", 
     type="l",lty=2, main="",xlim=c(7000,3400),lwd=2)
axis(2, ylim=c(0,max(med)),lwd=2,line=3.5)
points(time, med,pch=20)
mtext(2,text="Median Group Size",line=5.5)















roll_btc = rollmean(btc, 20)
roll_sp = rollmean(sp, 20)
roll_t = as.factor(t[seq(20,1259)])

cut_btc = roll_btc[seq(501, 1200)]
cut_sp = roll_sp[seq(501, 1200)]
cut_t = as.Date(t[seq(520, 1219)])


length(roll_t)

plot(roll_t, roll_btc, type = 'n')
lines(roll_t, roll_btc)
lines(roll_t, roll_sp, lwd = 2)

plot(cut_t, cut_btc, type = 'n')
lines(cut_t, cut_btc)
lines(cut_t, cut_sp, lwd = 2)

scaled_btc = cut_btc / cut_btc[1] * 100
scaled_sp = cut_sp / cut_sp[1] * 100

plot(cut_t, scaled_btc, type = 'l', col = "blue", xlab = "Time", ylab = "Price", frame.plot = F, lwd = 2, main = "20 Day Rolling Average of Indexed Bitcoin and SP500 Prices")
lines(cut_t, scaled_sp, col = "red", lwd = 2)
legend( "topleft", legend = c("Bitcoin", "SP500"), col = c("blue", "red"), lwd = 2)
