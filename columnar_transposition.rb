# Program Name: Regular Columnar Transposition
# Date:         August 23th, 2019
# Author:       Aaron Barlow

class ColumnarTransposition

  def initialize
    # Welcome the user to the program
    puts 'Welcome to Columnar Transposition!'
    # Sequentially call each instance method
    get_message
    get_keyword
    get_keyword_order
    generate_transposed_table
    generate_encrypted_message
  end

  def get_message
    # Request the user enter a message
    print 'Enter a message: '
    # Continue asking for a message until we get one
    loop do
      # Read in the message and remove the newline
      @user_message = gets.chomp
      # Then, remove any characters that are not alphanumeric
      @user_message = @user_message.gsub(/[^a-z0-9]/i, '')
      # When the message is blank
      if @user_message.empty?
        # Ask for a message again
        print 'Enter a *valid* message: '
      else # Otherwise, we have a valid message
        # Break out of the forever loop
        break
      end
    end
  end

  def get_keyword
    # Request the user enter a keyword
    print 'Enter a keyword to encrypt the string: '
    # Continue asking for a keyword until we get one
    loop do
      # Read in the string and remove the newline
      @user_keyword = gets.chomp
      # Then, remove any characters that are not alphanumeric
      @user_keyword = @user_keyword.gsub(/[^a-z0-9]/i, '')
      # Remove duplicate characters in the string
      @user_keyword = @user_keyword.split('').uniq.join('')
      # When the keyword is blank
      if @user_keyword.empty?
        # Ask for a keyword again
        print 'Enter a *valid* keyword to encrypt the string: '
      else # Otherwise, we have a valid keyword
        # Break out of the forever loop
        break
      end
    end
  end

  def get_keyword_order
    # Convert the keyword into an array with each element as a letter
    @keyword_array = @user_keyword.split('')
    # Then, alphanumerically sort each element such that the letter's
    # Indicies are correlated with the letter's alphanumeric placement
    @ordered_keyword = @keyword_array.sort_by { |a| a.downcase }
    # Initialize an array to the size of the keyword
    @ordered_number_keyword = Array.new(@user_keyword.size)

    # Iterate over the keyword array
    @keyword_array.each_with_index do |letter, index|
      # Set the ordered keyword value to the index of the letter
      @ordered_number_keyword[index] = @ordered_keyword.index(letter)
    end
  end

  def generate_transposed_table
    # Get the column size from the characters in the keyword
    @col_size = @user_keyword.size
    @row_size = (@user_message.length / @col_size.to_f).ceil
    @table = Array.new(@row_size) { Array.new(@col_size) }

    current_row = 0
    current_col = 0
    # Iterate through each character in the user string
    @user_message.split('').each do |letter|
      # Set the row and column's value to the letter
      @table[current_row][current_col] = letter

      # When we have reached the end of the column
      if current_col >= @col_size - 1
        # Go to the next row
        current_col  = 0
        current_row += 1
      else # Otherwise, when we are still on the same row
        # Move to the next column
        current_col += 1
      end
    end
  end

  def generate_encrypted_message
    encrypted_message = ''
    # Initialize an array to the length of the keyword
    @column_indices = Array.new(@ordered_number_keyword.size)
    # Iterate through the ordered keyword
    @ordered_number_keyword.each_with_index do |num, index|
      # Set the column index to the index of
      # The ordered and numerized keyword
      @column_indices[index] = @ordered_number_keyword.index(index)
    end

    current_row = 0
    # Iterate through the column indicies
    @column_indices.each_with_index do |col_num, index|
      # Then, iterate over the row
      (0..(@row_size - 1)).each do |row|
        # When the current row and column is null
        if @table[row][col_num].nil?
          # Get an array of random characters
          characters = ('A'..'Z').to_a
          # Then, add one (1) character to the encrypted string
          encrypted_message += characters[rand(characters.size)]
        else # Otherwise, a character is present
          # Add the character to the encrypted string
          encrypted_message += @table[row][col_num] || ''
        end
      end
    end

    # Print out the complete encrypted string in upper case
    puts "The encrypted message: #{encrypted_message.upcase}"
  end

end

# Initialize the columnar transposition class
ColumnarTransposition.new
