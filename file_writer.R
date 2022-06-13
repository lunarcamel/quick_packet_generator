require(tidyverse)
require(officer)
source('packet_generator.R')


#####Options#######
##################
tname <- "MRNA VACCINE II" #set tournament name here
npack <- 15 #set number of packets here
####################
####################

create_packet <- function(tname, n) {
  packet <- generate_packet()
  
  doc <- read_docx('blank_template.docx')
  doc <- body_add_par(doc, tname)
  doc <- body_add_par(doc, paste("Packet",n))
  doc <- body_add_par(doc, " ")
  
  
  doc <- body_add_par(doc, "Tossups")
  
  for(i in 1:20){
    doc <- body_add_par(doc, paste0(i,". <",packet$tu[i],">"))
  }
  
  doc <- body_add_par(doc, " ")
  doc <- body_add_par(doc, "Bonuses")
  
  for(i in 1:20){
    doc <- body_add_par(doc, paste0(i,". <",packet$bu[i],">"))
  }
  
  
  print(doc, target = paste0("packets/pack_", n, ".docx"))
}

for(i in 1:npack){
  create_packet(tname, i)
}