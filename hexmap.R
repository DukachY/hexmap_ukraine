# original code: https://rpubs.com/thoughtfulbloke/hexmap

# Windows:
# Sys.setlocale("LC_CTYPE", "ukrainian")

# MacOS:
Sys.setlocale(category ="LC_ALL", locale = "Ru_Ru")

library(plotrix)

# Function
hexmap <- function(xcor, ycor, colval, label) {
  plot(min(c(xcor,ycor)):(max(c(xcor,ycor))+1.5),min(c(xcor,ycor)):(max(c(xcor,ycor))+1.5), 
       type = "n", frame.plot = F, xaxt = "n", yaxt = "n", xlab = "", ylab = "")
  data <- data.frame(xcor, ycor, colval)
  for (i in 1:nrow(data)){
    hexagon(data[i,1], data[i,2], col = as.character(data[i, 3]), unitcell = 0.98, border = "white")
  }
  text(xcor + 0.5, ycor + 0.5, labels = label, cex = 0.7)
}


# Example
df <- read.csv2("hexmap_ukraine.csv", stringsAsFactors = F)

# choose your colors
df$mycol <- c("#5FA0A5", rep(c("#5FA0A5","#358490"), times = 12))

# just look at result
hexmap(df$x, df$y+1, df$mycol, label = df$obl.abr)


# How to save:
# svg
svg(filename="example_hexmap.svg", 
    width=5, 
    height=5, 
    pointsize=12)
hexmap(df$x, df$y+1, df$mycol, label = df$obl.abr)
dev.off()

# png
png(filename="example_hexmap.png", 
    units="in", 
    width=5, 
    height=5, 
    pointsize=8,
    res = 96)
hexmap(df$x, df$y+1, df$mycol, label = df$obl.abr)
dev.off()










