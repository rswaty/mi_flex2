
# Chord Diagram

library(chorddiag)
library(igraph)
library(readr)
library(tidygraph)


# read in data
bps2evt2 <- read_csv("bps2evt2.csv")

#convert to matrix
bps2evtMatrix<-as.matrix(as_adjacency_matrix(as_tbl_graph(bps2evt2),attr = "acres"))

#clean up matrix (could be cleaner!)
bps2evtMatrix = subset(bps2evtMatrix, select = -c(1,2,3,4,5,6))

bps2evtMatrix2 <- bps2evtMatrix[-c(7,8,9,10,11,12),]

#make a custom color pallet
groupColors <- c("#F26223", "#6c9174", "#957244", "#F26223", "#204a3e", "#97abad")

#make chord diagram
chord<-chorddiag(data = bps2evtMatrix2,
                 type = "bipartite",
                 groupColors = groupColors,
                 groupnamePadding = 10,
                 groupPadding = 3,
                 groupnameFontsize = 10 ,
                 showTicks = FALSE,
                 margin=150,
                 tooltipGroupConnector = "    &#x25B6;    ",
                 chordedgeColor = "#B3B6B7"
)
chord