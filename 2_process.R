
source("2_process/src/process_and_style.R")

p2_targets_list <- list(
  tar_target(
    p2_processed_data_rds,
    process_data(p1_merged_site_data,
                 p1_site_info_csv,
                 out_fpath = '2_process/out/processed_data.rds'),
    format = 'file'
  )
)