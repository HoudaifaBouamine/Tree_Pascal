program tree;

type
ptrTree = ^stTree;
stTree = record

    value : integer;
    left,right : ptrTree;

end;

procedure Print_Pre_Fixe(r : ptrTree); // root - left - right
begin
	
	if(r <> nil) then
	begin
	
        write(r^.value , ' ' );
        Print_Pre_Fixe(r^.left);
        Print_Pre_Fixe(r^.right);
        
    end;

end;

procedure Insert_Node(var r : ptrTree; new_value :integer);
begin
	
	if(r = nil) then
	begin
		
		 new(r);
         r^.left := nil;
         r^.right := nil;
         r^.value := new_value;
		
	end
	else
	begin
		
		if(new_value < r^.value) then 
            Insert_Node(r^.left,new_value)
        else
            Insert_Node(r^.right,new_value);
		
	end;
        
end;

procedure from_arr_to_binary_tree(var r : ptrTree ; var arr : array of integer; arrLength : integer);
var i : integer;
tmp : ptrTree;
begin
	
	
	if(arrLength > 0) then
	begin
		
		// Fill first element (root)
        new(r);
        r^.left := nil;
        r^.right := nil;
        r^.value := arr[0];
	
        for i := 1 to arrlength - 1 do
        begin

            tmp := r; // We must always start compare from the root
        	Insert_Node(tmp,arr[i]);
        	
        end;
	
	end;
	
end;

var arr : array [0..99] of integer;
arrLength : integer;
root : ptrTree;
begin
	
	arrLength := 12;
arr[0] := 50;
arr[1] := 22;
arr[2] := 5;
arr[3] := 79;
arr[4] := 45;
arr[5] := 66;
arr[6] := 30;
arr[7] := 70;
arr[8] := 49;
arr[9] := 80;
arr[10]:= 6;
arr[11]:= 32;
    
    from_arr_to_binary_tree(root,arr,arrLength);
    Print_Pre_Fixe(root);
    
	
end.




