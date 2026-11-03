library(tidyverse)

top_songs <- read_rds("clean_data.rds")

billboard_plot <- top_songs |>
  ggplot(aes(x = week, y = rank, color = track, group = track)) +
  geom_line(linewidth = 0.9, alpha = 0.9) +
  facet_wrap(vars(track), ncol = 3) +
  scale_y_reverse(breaks = c(1, 10, 20, 40, 60, 80, 100)) +
  scale_color_viridis_d(option = "turbo", guide = "none") +
  labs(
    title = "The Longest-Running Billboard Hits",
    subtitle = "Weekly chart rank for the 12 longest-running songs",
    x = "Week on the chart",
    y = "Billboard rank"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 18),
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold", size = 9),
    panel.spacing = unit(1, "lines")
  )

ggsave("billboard_plot.png", plot = billboard_plot, width = 10, height = 8)
