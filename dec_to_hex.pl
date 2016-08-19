#!/usr/bin/perl

###########################################################################################################################
# Here is a simple perl code that converts decimal numbers to equivalent hexa-decimal numbers.                            #
# The steps involved in the conversion are as follows:                                                                    #
# 1. Take the number from the user through command line ($temp_number)                                                    #
# 2. Divide the number by 16 and store the quotient ($temp_quotient)                                                      #
# 3. Take only the numbers to the left of the "." point using the split function ($quotient)                              # 
# 4. Get the nearest mulitple of 16 by multiplying the quotient and 16 ($nearest_multiple_of_16 = $quotient * 16)         #
# 5. Find the remainder by finding out the difference between the actual number and nearest multiple calculated in step 4 #
#   ($remainder = $temp_number - $nearest_multiple_of_16;)                                                                #
# 6. If the remainder is > 9, find the hexa-decimal equivalent from the hash                                              #
# 7. Unshift the remainder values to an array                                                                             #         
# 8. Repeat the process from step 2 to step 8 till the quotient is 0 ($temp_number = $quotient)                           #
########################################################################################################################### 

#Take the number from the user
$number = $ARGV[0];

#Hexa-decimal equivalent values for 10,11...15
%hex = ("10"=>"A","11"=>"B","12"=>"C","13"=>"D","14"=>"E","15"=>"F");

#Call the conversion
&convert_dec_to_hex($number);

sub convert_dec_to_hex
{
  $temp_number = @_[0];
  $quotient = $temp_number/16;
  #Repeat this till quotient is 0
  until($quotient == 0)
  {
    $temp_quotient = $temp_number/16;
    #Split at "." to get the integer
    @quotient_array = split(/\./,$temp_quotient);
    $quotient = @quotient_array[0];
    #Find the nearest multiple of 16 to find the remainder
    $nearest_multiple_of_16 = $quotient * 16;
    $remainder = $temp_number - $nearest_multiple_of_16;
    #Check if the remainder is > 9 and push the value to array @hex_array
    if($remainder > 9)
    {
      #Find the hexa-decimal equivalent value from the hash
      $hex_remainder = $hex{$remainder};
      unshift(@hex_array,$hex_remainder);
    }
    else
    {
      unshift(@hex_array,$remainder);
    } 
    $temp_number = $quotient;
  }
    print "($number)10 => (@hex_array)16 \n";
}
