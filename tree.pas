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


begin
	
	
end.