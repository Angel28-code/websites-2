library(tidyverse)

billboard_long <- tidyr::billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    names_transform = list(week = as.integer),
    values_to = "rank"
  ) |>
  filter(!is.na(rank))

top_tracks <- billboard_long |>
  count(track, sort = TRUE) |>
  slice_head(n = 12) |>
  pull(track)

top_songs <- billboard_long |>
  filter(track %in% top_tracks) |>
  mutate(track = factor(track, levels = top_tracks))

write_rds(top_songs, file = "clean_data.rds")