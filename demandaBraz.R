require(tidyverse)
require(magrittr)

speciesOfInterest = c("Handroanthus serratifolius",
                      "Handroanthus impetiginosus",
                      "Apuleia leiocarpa",
                      "Hymenolobium heterocarpum",
                      "Astronium ulei",
                      "Peltogyne lecointei",
                      "Amburana acreana")

invMerged = read.csv("data/10_invPaisagensMerged.csv")

invMerged %>% filter(scientific.name %in% speciesOfInterest) %>%
  group_by(area, scientific.name) %>%
  summarise(count = n()) %>%
  pivot_wider(names_from = scientific.name, values_from = count) %>%
  write.csv('ocorrenciaSpecies.csv')
