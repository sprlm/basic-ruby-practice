def byte_lowercase?(byte)
  byte.between?(65, 90)
end

def byte_uppercase?(byte)
  byte.between?(97, 122)
end

def byte_letter?(byte)
  byte_lowercase?(byte) || byte_uppercase?(byte)
end

def caeser_cipher(string, shift_factor)
  shift_factor = shift_factor.remainder(26) # Simplify shift factor if > 26 or < -26
  encrypted_string = []

  string.each_byte do |char_byte|
    if byte_letter?(char_byte) # Only shift letters
      char_byte_shifted = char_byte + shift_factor

      # Wrap from z to a and vice versa
      if byte_lowercase?(char_byte) 
        char_byte_shifted -= 26 if char_byte_shifted > 90
        char_byte_shifted += 26 if char_byte_shifted < 65
      elsif byte_uppercase?(char_byte) 
        char_byte_shifted -= 26 if char_byte_shifted > 122
        char_byte_shifted += 26 if char_byte_shifted < 97
      end
      
      encrypted_string.push(char_byte_shifted.chr)
    else
      encrypted_string.push(char_byte.chr)
    end
  end

  p encrypted_string.join
end

caeser_cipher("What a string!", 5)