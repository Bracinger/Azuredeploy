$folder1 = "D:\test1"
$folder2 = "D:\test2"

# Get all files under $folder1, filter out directories
$firstFolder = Get-ChildItem -Recurse $folder1 

$firstFolder | ForEach-Object {

    # Check if the file, from $folder1, exists with the same path under $folder2
    
        # Compare the contents of the two files...
        if(Compare-Object $folder1 $folder2) {

            # List the paths of the files containing diffs
            $_.FullName
            $_.FullName.Replace($folder1, $folder2)
       } 
}