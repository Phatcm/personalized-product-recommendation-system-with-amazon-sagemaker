Sagemaker Recommendation Engine Guildline
Clone the source code from GitHub then:

1. Setting up for ETL process
	- Go to folder 'ETL processing' -> 'scrips' and run file 'Create script.sql' by PostgreSQL 
	- Go to folder 'ETL processing' and run file 'Completed_ETL_Process.kjb' by Pentaho Data Integration
2. Setting up for Sagemaker
	- Go inside the 'Sagemaker Recommender' Folder -> Upload the folders and files with exact format tree to Jupiter notebook (or Sagemaker studio notebook)
	- Set up environment for Aws services(Role,Host,Region,Server...) and replace these info in: 'Aws SageMaker -> Resources-> env ->AwsCfg.env
	- Replace info of PostgreSQL Database into 'LoadDataFromPostgresToRedShift.ipynb' in folder 'Aws SageMaker -> Notebooks' 
	- Go to folder 'Aws SageMaker -> Notebooks' and run file 'LoadDataFromPostgresToRedShift.ipynb' by Jupiter Notebook
	- Go to folder 'Aws SageMaker -> Notebooks' and run file 'Retail Recommendation Engine.ipynb' by Jupiter Notebook
	
