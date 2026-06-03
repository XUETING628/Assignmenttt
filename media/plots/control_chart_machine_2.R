# Control Chart for Machine 
2
machine_data <- filtered_data %>% filter(Machine == 2) %>% mutate(index = row_number())
mean_pl <- mean(machine_data$PartLength)
mr <- c(NA, abs(diff(machine_data$PartLength)))
amr <- mean(mr, na.rm = TRUE)
d2 <- 1.128 # For subgroup size 2 (moving range between consecutive points)
UCL_control <- mean_pl + 3 * (amr / d2)
LCL_control <- mean_pl - 3 * (amr / d2)
p_control <- ggplot(machine_data, aes(x = index, y = PartLength)) +
  geom_line(color = "#0072B2") +
  geom_point(color = "#0072B2") +
  geom_hline(yintercept = mean_pl, linetype = "dashed", color = "black", aes(text = paste("CL:", round(mean_pl, 2)))) +
  geom_hline(yintercept = UCL_control, linetype = "dotted", color = "red", aes(text = paste("UCL:", round(UCL_control, 2)))) +
  geom_hline(yintercept = LCL_control, linetype = "dotted", color = "red", aes(text = paste("LCL:", round(LCL_control, 2)))) +
  labs(
    title = "Control Chart for PartLength (Machine 2 at 338K, 200kPa)",
    x = "Observation Index",
    y = "PartLength"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18),
    axis.title = element_text(size = 18),
    axis.text = element_text(size = 14),
    panel.background = element_rect(fill = "white", colour = "white")
  )
plotly_control <- ggplotly(p_control, tooltip = c("x", "y", "text"))
saveWidget(plotly_control, "/content/project/media/plots/control_chart_machine_2.html", selfcontained = TRUE)
