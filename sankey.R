

library(networkD3)
library(dplyr)
library(readr)


sizingPolicy(viewer.suppress = TRUE,
             knitr.figure = FALSE,
             browser.fill = TRUE,
             browser.padding = 75,
             knitr.defaultWidth = 800,
             knitr.defaultHeight = 500)


links <- read_csv("mh_plantations2.csv")

nodes <- data.frame(
  name=c(as.character(links$source), 
         as.character(links$target)) %>% unique()
)

nodes <- data.frame(
  name=c(as.character(links$source), 
         as.character(links$target)) %>% unique()
)


links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

# Make the Network
p <- sankeyNetwork(Links = links, 
                   Nodes = nodes,
                   Source = "IDsource", 
                   Target = "IDtarget",
                   Value = "value", 
                   NodeID = "name", 
                   sinksRight=FALSE,
                   fontSize = 14)

p