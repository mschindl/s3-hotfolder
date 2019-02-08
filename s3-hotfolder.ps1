# Check README_s3-hotfoler
###
# "Hot Foler" Transferscript
# Multiple File Upload per loop
# Rename files with adding S3_ in front of the filename
# Exclude all files which starts with S3_
# Create temp URL for duration time
###
	$ProgressPreference = "SilentlyContinue"
	#Profile / Credentials
	$vProfile = "SGPub"
	# Folder path
	$vFileDirectory = "/Users/marc/Downloads/TMP2"
	# Bucket name
	$vBucketname =  "sync-and-share"
	#Duration: one week
	$vDuration = date -v+1w +%s
	###
	# Execute script…
	foreach($FileName in Get-ChildItem -Name $vFileDirectory -recurse -exclude S3_*)
	{
		printf "Write-S3Object \n"
		Write-S3Object -Profile $vProfile -BucketName $vBucketname -InFile $vFileDirectory/$FileName
		Start-Sleep -Seconds 1
		printf "\n"
		printf "Get-S3PreSignedURL \n"
		Get-S3PreSignedURL -Profile $vProfile -BucketName $vBucketname -Key $FileName $duration
		printf "\n"
		Rename-Item -Path $vFileDirectory/$FileName -NewName S3_$FileName
}
