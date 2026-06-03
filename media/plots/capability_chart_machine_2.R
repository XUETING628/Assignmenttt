# Process Capability Chart for Machine 
2
machine_data <- filtered_data %>% filter(Machine == 2)
p_capability <- ggplot(machine_data, aes(x = PartLength)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 0.5, fill = "#009E73", color = "black", alpha = 0.7) +
  geom_density(color = "#D55E00", linewidth = 1) +
  geom_vline(xintercept = LSL, linetype = "solid", color = "#0072B2", linewidth = 1, aes(text = paste("LSL:", LSL))) +
  geom_vline(xintercept = Target, linetype = "solid", color = "#009E73", linewidth = 1, aes(text = paste("Target:", Target))) +
  geom_vline(xintercept = USL, linetype = "solid", color = "#0072B2", linewidth = 1, aes(text = paste("USL:", USL))) +
  labs(
    title = "Process Capability for PartLength (Machine 2 at 338K, 200kPa)",
    x = "PartLength",
    y = "Density"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18),
    axis.title = element_text(size = 18),
    axis.text = element_text(size = 14),
    panel.background = element_rect(fill = "white", colour = "white")
  )
plotly_capability <- ggplotly(p_capability, tooltip = c("x", "y", "text"))
saveWidget(plotly_capability, "/content/project/media/plots/capability_chart_machine_2.html", selfcontained = TRUE)
