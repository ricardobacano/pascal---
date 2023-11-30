program matriz_pascal;

type matriz = array[1..100,1..100] of integer;

var
    M: matriz; 
    lin, col : integer;

function tem_repetidos(var M: matriz; lin, col: integer; var repetiu_i,repetiu_j):boolean;
var
    i, j, p, q : integer;
    repetiu : boolean;
begin
    repetiu := false;
    i := 1;
    while (i <= lin) and not repetiu do 
    begin
        j := 1;
        while (j <= col) and not repetiu do 
        begin
            p := 1;
            while (p <= lin) and not repetiu do 
            begin
                q := 1; 
                while (q <= col) and not repetiu do 
                begin   
                    if ((M[i,j] = M[p,q]) and ((i <> p ) or (j <> q))) then 
                    begin
                        repetiu := true;
                        repetiu_i := i;
                        repetiu_j := j;
                    end;
                q := q + 1;
                end;
            p := p + 1;
            end;
        j := j + 1;
        end;
    i := i + 1;
    end;
end;

(*)
has_repeats := tem_repetidos(M,lin,col,repetiu_i,repetiu_j);

if has_repeats then
    writeln(repetiu_i, ' ', repetiu_j)
else
    write('não tem repetidos');


