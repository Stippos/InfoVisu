data <- read.table("olive.csv", header = T, sep = ',')

library(lattice)

xyplot(data)

pairs(data[c(7,9,8,11)],pch = 21, bg =  c("green", "red", "blue")[unclass(data$Region)])
par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), mar=c(0, 0, 0, 0), new=TRUE)
plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
legend("topleft", legend =  c("Region 1", "Region 2", "Region 3"), col = c("green", "red", "blue"), pch = 19, box.lty = 0, cex = 0.8)
