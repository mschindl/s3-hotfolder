# "Hot Folder" S3 transfer script
Updated on 8 Feb 2019

Workflow:
- Multiple File Upload per loop
- Rename files with adding S3_ in front of the filename
- Exclude all files which starts with S3_
- Create temp URL for duration time

Requirements:
1. install S3-Client, i.e.
https://github.com/ffeldhaus/S3-Client
2. customize variables
3. run script and move files to S3 target