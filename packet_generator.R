require(tidyverse)


generate_packet <- function(){

  lit <- c("lit_am", "lit_world", "lit_brit", "lit_euro")
  hist <- c("hist_am", "hist_world", "hist_euro", "hist_other")
  sci <- c("sci_physics", "sci_chem", "sci_bio", "sci_other")
  rmpss <- c("religion", "myth", "phil", "ss")
  art_other <- c("vfa", "afa", "ofa", "other")

for(i in 1:99999999){
  tu_cats <- cbind(sample(lit), sample(hist), sample(sci), sample(rmpss), sample(art_other))
  tu <- c(sample(tu_cats[1,]), 
          sample(tu_cats[2,]), 
          sample(tu_cats[3,]), 
          sample(tu_cats[4,]))
  
  
  bu_cats <- cbind(sample(lit), sample(hist), sample(sci), sample(rmpss), sample(art_other))
  bu <- c(sample(bu_cats[1,]), 
          sample(bu_cats[2,]), 
          sample(bu_cats[3,]), 
          sample(bu_cats[4,]))
  
  packet <- tibble(tu, bu)
  
  check <- packet %>% 
    separate(tu, into = c("tu_prim", "tu_sub")) %>%
    separate(bu, into = c("bu_prim", "bu_sub")) %>% 
    mutate(check = ifelse(tu_prim == bu_prim, 1, 0))
  
  if(sum(check$check) > 0){
    next
  } else if(sum(check$check) == 0) {
    return(tibble(tu,bu))
    break
  }
  
}

}
