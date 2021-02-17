# Amir Nakar
# 09/02/2021
# Part of Raman Spectroscopy labwork at FSU


#### Load up the data ####
bcarotene.source = "https://raw.githubusercontent.com/amirnakar/Teaching-RamanSpecLab/main/Data%20sample/B-Carotene/CM-200113-bCarotene.txt"
Carbon1.source = "https://raw.githubusercontent.com/amirnakar/Teaching-RamanSpecLab/main/Data%20sample/Carbon/CM-200113-Carbon-Carbon1.txt"
Carbon2.source = "https://raw.githubusercontent.com/amirnakar/Teaching-RamanSpecLab/main/Data%20sample/Carbon/CM-200113-Carbon-Carbon2.txt"
Carbon3.source = "https://raw.githubusercontent.com/amirnakar/Teaching-RamanSpecLab/main/Data%20sample/Carbon/CM-200113-Carbon-Carbon3.txt"
Terpen1.source = "https://raw.githubusercontent.com/amirnakar/Teaching-RamanSpecLab/main/Data%20sample/Terpanes/CM-200113-Terpans-Terpane1.txt"
Terpen2.source = "https://raw.githubusercontent.com/amirnakar/Teaching-RamanSpecLab/main/Data%20sample/Terpanes/CM-200113-Terpans-Terpane2.txt"


read.raman.data <- function(source) {
    output = read.table(file = source, skip = 34, col.names = c("Wavenumber", "Intensity"))
    output
  }
bCarotene = read.raman.data(bcarotene.source)
Carbon1 = read.raman.data(Carbon1.source)
Carbon2 = read.raman.data(Carbon2.source)
Carbon3 = read.raman.data(Carbon3.source)
Terpen1 = read.raman.data(Terpen1.source)
Terpen2 = read.raman.data(Terpen2.source)

#### Plot each spectrum ####
library(tidyverse)

plot.raman.data <- function(data, title) {
  output = ggplot(data, aes(x=Wavenumber ,y=Intensity)) +
    geom_line() +
    labs(
      x = expression("Wavenumber" ~ (cm^{-1})),
      y=expression("Intensity (A.U.)"),
      title = title
    ) + 
    theme_bw() + 
    theme(plot.title = element_text(color = "Black", size = 18))
  
  output
}

bCar.graph = plot.raman.data(bCarotene, expression(beta ~ "-Carotene"))
Carbon1.graph = plot.raman.data(Carbon1, "Carbon 1")


#### To Do List ####
# 1. Move to notebook
# 2. find peaks
# 3. Mark peaks
# 4. Add metadata
# 5. Compare figures
# 6. Output report to PDF
