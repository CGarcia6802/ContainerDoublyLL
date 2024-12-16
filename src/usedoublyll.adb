with Ada.Text_IO; use Ada.Text_IO;
with integer_Container; use integer_Container;
with Ada.Unchecked_Deallocation;

procedure useDoublyLL is

   package IIO is new Ada.Text_IO.Integer_IO(integer); use IIO;

   str1: String := "IR";
   avail, int1: integer;

   --int_Container = node, int_node_point = nodeptr
   procedure Free is new Ada.Unchecked_Deallocation(int_Container, int_Node_Point);
   head, ip, dp, pt: int_Node_Point := null;

begin



while not End_Of_File loop --reads file

      get(str1);

      --init head
      head := new int_Container;
      pt := new int_Container;
      head.value := 0;
      avail := 0;
      head.previous := head;
      head.next := head;


      if (str1 = "IR") then
         --grab integer
         ip := new int_Container;
         get(int1);

         --insertion
         pt := head;
         ip.value := int1;
         ip.previous := pt;
         ip.next := pt.next;
         pt.next.previous := ip;
         pt.next := ip;
         pt := ip;
         avail := avail + 1;

      elsif (str1 = "IL") then
         ip := new int_Container;
         get(int1);

         pt := head;
         ip.value := int1;
         ip.next := pt;
         ip.previous := pt.previous;
         pt.previous.next := ip;
         pt.previous := ip;
         pt := ip;
         avail := avail + 1;


      elsif (str1 = "D ") then
         get(int1);

         --deletion
         while head /= null loop
            if head.value = int1 then
               dp := head;
               dp.previous.next := dp.next;
               dp.next.previous := dp.previous;
               avail := avail - 1;
            else
               put ("Deletion could not be done due to not being found");
            end if;

            head := head.next;
         end loop;
         New_Line;

      elsif (str1 = "PF") then
         Put("Integers from right to left");
         New_Line;

         while head /= null loop
            put(integer'image(ip.value)); put(" ");
            head := head.next;
         end loop;

      elsif (str1 = "PL") then
         while head /= null loop
            put(integer'image(ip.value)); put(" ");
            head := head.previous;
         end loop;

      elsif (str1 = "PN") then
         Put("Amount of integers in the list: ");
         Put(integer'image(avail));
         New_Line;

      else
         Skip_Line;
      end if;

   end loop;

end useDoublyLL;
