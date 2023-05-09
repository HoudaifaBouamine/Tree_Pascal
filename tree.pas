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

function max(num1 ,num2: integer) : integer;
begin
	if(num1 > num2) then max := num1 else max := num2; 
end;

function min(num1 ,num2: integer) : integer;
begin
	if(num1 < num2) then min := num1 else min := num2; 
end;

function get_max(root : ptrTree) : integer;
begin
	
	if(root^.left = nil) and (root^.right = nil) then
        get_max := root^.value
    else if(root^.left = nil) then // so right is not nil
        get_max := max(get_max(root^.right),root^.value)
    else if(root^.right = nil) then // so left is not nil
        get_max := max(get_max(root^.left),root^.value)
    else // both are not nil
        get_max := max(max(get_max(root^.left),root^.value),get_max(root^.right));
	
end;

function get_min(root : ptrTree) : integer;
begin
	
	if(root^.left = nil) and (root^.right = nil) then
        get_min := root^.value
    else if(root^.left = nil) then // so right is not nil
        get_min := min(get_min(root^.right),root^.value)
    else if(root^.right = nil) then // so left is not nil
        get_min := min(get_min(root^.left),root^.value)
    else // both are not nil
        get_min := min(min(get_min(root^.left),root^.value),get_min(root^.right));
	
end;

function is_binary_search_tree(r : ptrTree) : boolean;
begin

	if(r <> nil)then
	begin 
        if(r^.left <> nil) and (r^.right <> nil) then
            is_binary_search_tree := (get_max(r^.left) < r^.value) and (get_min(r^.right) >= r^.value) and (is_binary_search_tree(r^.right)) and (is_binary_search_tree(r^.left)) 
        else if (r^.left <> nil) then 
            is_binary_search_tree := (get_max(r^.left) < r^.value)and (is_binary_search_tree(r^.left)) 
        else if (r^.right <> nil) then
            is_binary_search_tree := (get_min(r^.right) >= r^.value)and(is_binary_search_tree(r^.right))
         else 
            is_binary_search_tree := true;
   end
    else
    is_binary_search_tree := true;

end;

var arr : array [0..99] of integer;
arrLength:integer;
root : ptrTree;
begin
	
	arrLength := 9;
arr[0] := 45;
arr[1] := 15;
arr[2] := 79;
arr[3] := 90;
arr[4] := 10;
arr[5] := 55;
arr[6] := 12;
arr[7] := 20;
arr[8] := 50;
    
    from_arr_to_binary_tree(root,arr,arrLength);
    Print_Pre_Fixe(root);
    writeln;
    

    writeln('Sorted ? : ' ,is_binary_search_tree(root));
    writeln;

    writeln('Change 12 to 11 : (expect no problem)');
    root^.left^.left^.right^.value := 11;
    writeln('Sorted ? : ' ,is_binary_search_tree(root));
    writeln;   
    
    writeln('Change 11 to 9 : (expect problem)');
    root^.left^.left^.right^.value := 9;
    writeln('Sorted ? : ' ,is_binary_search_tree(root));
    writeln;   
end.




