extends Node



func findSide(line):
	return "	"

func preprocess(file,defined=[],side=""):
	
	var regex = RegEx.new()
	regex.compile("#import \"(.+)\"")
	
	var f = File.new()
	if (not f.file_exists(file)): return
	f.open(file, f.READ)
	
	var output = ""
	while (not f.eof_reached()):
		var content = f.get_line()
		
		regex.find(content)
		var finds = regex.get_captures()
		if (finds[0].length() > 0):
			print(finds[0])
			print(preprocess(finds[1],defined,"	"))
			content.replace(finds[0],preprocess(finds[1],defined,"	"))
		
		
		output += side + content + "\n"
	f.close()
	return output