with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Assgn;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Assgn;
--
with ada.numerics.discrete_random;


package body Assgn is 

--initialize first array (My_Array) with random binary values --UNFINISHED NOT RANDOM
   procedure Init_Array (Arr: in out BINARY_ARRAY) is
      subtype randRange is Integer range 0..1;
      package RNG is new Ada.Numerics.Discrete_Random (Result_Subtype => randRange);
      use RNG;
      gen : Generator;
      num : Integer;
   begin
      
      for i in 1..16 loop
         reset(gen);
         num := random(gen);
         Arr(i) := num;
      end loop;
   
   end Init_Array;

--reverse binary array
   procedure Reverse_Bin_Arr (Arr : in out BINARY_ARRAY) is
   newArr : BINARY_ARRAY := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   begin
      Put("[");
      for i in 1..16 loop
         Put(Arr(16 - i + 1), 1);
         newArr(i) := Arr(16 - i + 1);
         if i < 16 then
            Put(", ");
         end if;
         
      end loop;
      Put("]");
      New_Line;
      Arr := newArr;
   end Reverse_Bin_Arr;
   
   
--print an array
   procedure Print_Bin_Arr (Arr : in BINARY_ARRAY) is
   begin
      Put("[");
      for i in 1..16 loop
         Put(Arr(i),1);
      
         if i < 16 then
            Put(", ");
         end if;
         
      end loop;
      Put("]");
      New_Line;
   
   end Print_Bin_Arr;

--Convert Integer to Binary Array
   function Int_To_Bin(Num : in INTEGER) return BINARY_ARRAY is
      Arr : BINARY_ARRAY := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      myNum : Integer := Num;
   begin
      for i in 1..16 loop
         if myNum - (2**(16 - i)) >= 0 then
            Arr(i) := 1;
            myNum := myNum - (2**(16 - i));
            end if;
      end loop;
      
      return Arr;
   end Int_To_Bin;
     

--convert binary number to integer
   function Bin_To_Int (Arr : in BINARY_ARRAY) return INTEGER is
      Num : Integer := 0;
   begin
      for i in 1..16 loop
         if Arr(i) = 1 then
            num := num + 2**(16 - i);
         end if;
      end loop;
      
      return num;
   end Bin_To_Int;
     
--overloaded + operator to add two BINARY_ARRAY types together
   function "+" (Left, Right : in BINARY_ARRAY) return BINARY_ARRAY is
      result : BINARY_ARRAY;
      newLeft : Integer := Bin_To_Int(left);
      newRight : Integer := Bin_To_Int(right);
   begin
      result := Int_To_Bin(newLeft + newRight);
      return result;
      
   end "+";
   
--overloaded + operator to add an INTEGER type and a BINARY_ARRAY type together
function "+" (Left : in INTEGER;
              Right : in BINARY_ARRAY) return BINARY_ARRAY is
      result : BINARY_ARRAY;
      newRight : Integer := Bin_To_Int(right);
   begin
      result := Int_To_Bin(left + newRight);
      return result;
      
   end "+";

--overloaded - operator to subtract one BINARY_ARRAY type from another			 
function "-" (Left, Right : in BINARY_ARRAY) return BINARY_ARRAY is
      result : BINARY_ARRAY;
      newLeft : Integer := Bin_To_Int(left);
      newRight : Integer := Bin_To_Int(right);
   begin
      result := Int_To_Bin(newLeft - newRight);
      return result;
      
   end "-";

--overloaded - operator to subtract a BINARY_ARRAY type from an INTEGER type
function "-" (Left : in Integer;
                 Right : in BINARY_ARRAY) return BINARY_ARRAY is
      result : BINARY_ARRAY;
      newRight : Integer := Bin_To_Int(right);
   begin
      result := Int_To_Bin(left - newRight);
      return result;      
      
   end "-";
   
end Assgn;
