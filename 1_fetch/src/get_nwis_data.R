
download_nwis_site_data <- function(out_fpath, parameterCd, startDate, endDate){
  
  # the out_fpath is expected to be of format '1_fetch/out/nwis_<site_num>_data.csv'
  site_num <- basename(out_fpath) %>% 
    stringr::str_extract(pattern = "(?:[0-9]+)")
  
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
  
  return(data_out)
}

merge_nwis_site_data <- function(in_data_ls) {
  merged_data <- data.frame()
  for (in_data in in_data_ls) {
    merged_data <- bind_rows(merged_data, in_data)
  }
  return(merged_data)
}

nwis_site_info <- function(fileout, site_data){
  site_no <- unique(site_data$site_no)
  site_info <- dataRetrieval::readNWISsite(site_no)
  write_csv(site_info, fileout)
  return(fileout)
}
