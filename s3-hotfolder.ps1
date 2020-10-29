# Check README.md for additional information
###
	$ProgressPreference = "SilentlyContinue"
	#Profile / Credentials
	$vProfile = "SGPub"
	# Folder path
	$vFileDirectory = "~/scratch/"
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
