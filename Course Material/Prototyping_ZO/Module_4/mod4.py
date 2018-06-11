# print("Hello World")
# fruit2 = ["apple", "banana", "cherry", "date"]
# # Fruits is a list of strings
# #For loop-- looking at each item known as "fruit" in list "fruit2"
# for fruit in fruit2:
#     print("I always love to eat a fresh %s." % fruit)
# # Map the fruits list over to a new list containing the length of the fruit strings:
# # Looking through the # of characters in list "fruit2" for "fruit"
# # len(fruit) = # of characters in the item "fruit"
# fruit_size = [len(fruit) for fruit in fruit2]
# #print(fruit_size)
# avg_fruit_size = sum(fruit_size) / len(fruit_size)

# print("The average fruit string length is %4.2f." % avg_fruit_size)
# long_string = """This
# is my
# very long
# multiple-line
# string"""
# print(long_string)
# a = None
# b = None
# c = None
# d = None
# a = 9   / 10     # Floating-point division
# b = 9.0 / 10.0 # Floating-point division
# c = 9   // 10   # Integer division
# d = 9.0 // 10.0 # Integer division, even though the resulting value is a float
# print(a,b,c,d)
import re


 
Regex1 = "Programmers will often write hello world as their first project with a programming language."
Regex2 = "The gooey peanut butter and jelly sandwich was a beauty."
Regex3 =  """AA312
            AA1298
            NW1234
            US443
            US31344
            AA123extratext A123 AZ12345"""
## Regular expressions

# 1) Matching "hello world" in a sentence
a = re.search('hello world',  Regex1)
print (a)

# 2) Find all words in an input string that contain a triple vowel
for word in Regex2.split():
	if re.findall('[aeiou]{3}', word):
		print (word)

# 3) Match an input string that is entirely a flight code, of the format AA####, 
#where AA is a two-letter uppercase airline code, and #### is a three- or four-digit flight number
for word2 in Regex3.split():
	if re.findall('[A-Z]{2}\d{3,4}', word2) and len(word2) <= 6:
		print (word2)



### Baseball Counter

# import sys, os
 
# if len(sys.argv) < 2:
#     sys.exit("Usage: %s filename" % sys.argv[0])
# filename = sys.argv[1]
# if not os.path.exists(filename):
# 	sys.exit("Error: File '%s' not found" % sys.argv[1])
name_file = "cardinals-1940.txt"

file = open(name_file, "r") 
# === St.Louis Cardinals vs. Chicago Cubs, 1940-04-19 ===
players = ['Pepper Martin','Walker Cooper','Johnny Mize','Ernie Koy','Enos Slaughter',
'Joe Medwick','Terry Moore','Joe Orengo','Jimmy Brown','Marty Marion','Don Gutteridge',
'Johnny Hopp','Creepy Crespi','Mickey Owen','Bill DeLancey','Don Padgett','Stu Martin',
'Eddie Lake','Hal Epps','Lon Warneke','Harry Walker','Max Lanier','Bill McGee','Carl Doyle',
'Mort Cooper','Clyde Shoun','Carden Gillenwater','Bob Bowman']
list = []
for player in players:
	player = {'Name':str(player),'Bats': 0,'Hits': 0,'Runs': 0,}
	list.extend([player])
for line in file.readlines():
	for dict in list:
		if line.startswith(dict['Name']):
			#print(line)
			num = re.findall('\d',line)
			#print(num)
			dict['Bats'] = dict['Bats'] + int(num[0])
			dict['Hits'] = dict['Hits'] + int(num[1])
			dict['Runs'] = dict['Runs'] + int(num[2])
 			# hits.append(num[1])
			# runs.append(num[2])


for dict2 in list:
	dict2['BA'] = format(round(float(dict2['Hits'])/float(dict2['Bats']),3),'.3f')
	print ("%s: %s" % (dict2['Name'], dict2['BA']))

	file.close()

