
download_nwis_site_data <- function(site_num, parameterCd, startDate, endDate){
  
  out_fpath <- file.path('1_fetch/out', paste0('nwis_', site_num, '_data.csv'))
  
  # readNWISdata is from the dataRetrieval package
  data_out <- readNWISdata(sites=site_num, service="iv", 
                           parameterCd = parameterCd, startDate = startDate, endDate = endDate)
  
  # -- simulating a failure-prone web-sevice here, do not edit --
  set.seed(Sys.time())
  if (sample(c(T,F,F,F), 1)){
    stop(site_num, ' has failed due to connection timeout. Try tar_make() again')
  }
  # -- end of do-not-edit block
  
  write_csv(data_out, file = out_fpath)
  return(out_fpath)
}

merge_nwis_site_data <- function(in_files) {
  merged_data <- data.frame()
  for (in_file in in_files) {
    current_data <- read_csv(in_file, col_types = 'ccTdcc')
    merged_data <- bind_rows(merged_data, current_data)
  }
  return(merged_data)
}

nwis_site_info <- function(fileout, site_data){
  site_no <- unique(site_data$site_no)
  site_info <- dataRetrieval::readNWISsite(site_no)
  write_csv(site_info, fileout)
  return(fileout)
}
