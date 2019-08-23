# ColumnarTransposition

### Usage:
The specific implementation of columnar transposition was regular columnar transposition, whereby blank columns in the final row get filled with random characters. First, ensure ruby is installed. I utilized ruby 2.5 for this project, although a minimum of ruby 2.2 is likely required. To run the program, when one is inside of the directory containing the ruby columnar transposition file, run the following command: ruby ./columnar_transposition.rb

Next, you will be prompted for a message to encrypt. Enter any alphanumeric string you wish and then press enter. Then, you will be promoted for a keyword with which to encrypt the string. Enter an alphanumeric string and then press enter. Note, only the first use of a character in the keyword will be used to encrypt the string. You will then be presented with the encrypted message in upper case letters. If a non-alphanumeric key is supplied for either the string or keyword, you will be continually asked for a valid alphanumeric message or keyword until it is provided. Remember, empty columns on the last row of the matrix will be filled with random letters. Thus, when the size of the keyword, minus duplicate letters, does not evenly divide into the size of the string, random characters will be present in the final encrypted string.

### Sample Input and Output:
1.
*   Input Message: "josh"
*   Input Keyword: "ta"
* 	Encrypted Output: "OHJS"
2.	
* 	Input Message: 	"Work hard everyday!"
* 	Input Keyword: 	"will"
* 	Encrypted Output: 	"OHDEDWRAERATWKRVYY"
3.	
* 	Input Message:	"Run Forest Run!"
* 	Input Keyword:	"smart"
* 	Encrypted Output:	NSGUENFTNRRUORN
