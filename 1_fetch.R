
source("1_fetch/src/get_nwis_data.R")

parameter_cd = "00010"
start_date = "2014-05-01"
end_date = "2015-05-01"

p1_targets_list <- list(
  tar_target(
    p1_site_data_01427207,
    download_nwis_site_data("1_fetch/out/nwis_01427207_data.csv",
                            parameterCd = parameter_cd,
                            startDate = start_date,
                            endDate = end_date)
  ),
  tar_target(
    p1_site_data_01432160,
    download_nwis_site_data("1_fetch/out/nwis_01432160_data.csv",
                            parameterCd = parameter_cd,
                            startDate = start_date,
                            endDate = end_date)
  ),
  tar_target(
    p1_site_data_01435000,
    download_nwis_site_data("1_fetch/out/nwis_01435000_data.csv",
                            parameterCd = parameter_cd,
                            startDate = start_date,
                            endDate = end_date)
  ),
  tar_target(
    p1_site_data_01436690,
    download_nwis_site_data("1_fetch/out/nwis_01436690_data.csv",
                            parameterCd = parameter_cd,
                            startDate = start_date,
                            endDate = end_date)
  ),
  tar_target(
    p1_site_data_01466500,
    download_nwis_site_data("1_fetch/out/nwis_01466500_data.csv",
                            parameterCd = parameter_cd,
                            startDate = start_date,
                            endDate = end_date)
  ),
  tar_target(
    p1_merged_site_data,
    merge_nwis_site_data(list(p1_site_data_01427207,
                              p1_site_data_01432160,
                              p1_site_data_01435000,
                              p1_site_data_01436690,
                              p1_site_data_01466500)),
  ),
  tar_target(
    p1_site_info_csv,
    nwis_site_info(fileout = "1_fetch/out/site_info.csv",
                   p1_merged_site_data),
    format = "file"
  )
)