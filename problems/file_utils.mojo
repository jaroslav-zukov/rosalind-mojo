def read_from_downloads(fileName: String, extension: String = "txt") -> String:
    downloadDir = "/home/jaro/Downloads/"
    file = open(downloadDir+fileName+"."+extension, "r")
    return file.read()