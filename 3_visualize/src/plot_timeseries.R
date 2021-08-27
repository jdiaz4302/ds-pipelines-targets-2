plot_nwis_timeseries <- function(out_fpath, in_fpath, width = 12, height = 7, units = 'in'){
  
  site_data_styled <- readRDS(in_fpath)
  ggplot(data = site_data_styled, aes(x = dateTime, y = water_temperature, color = station_name)) +
    geom_line() + theme_bw()
  ggsave(out_fpath, width = width, height = height, units = units)
  
  return(out_fpath)
}