package integer_Container is
   
   type int_Container;
   type int_Node_Point is access int_Container;
   
   type int_Container is record
      value: integer;
      next, previous: int_Node_Point := null;
   end record;

end integer_Container;
