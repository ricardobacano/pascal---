program prova2014_2;

type matriz = array[1..100,1..100] of integer;

var 
    M1, M2, M3: matriz;
    tam_m: integer; 

procedure ler_matriz(var M: matriz; tam: integer);
var
    i, j : integer;
begin
    for i := 1 to tam do 
        for j := 1 to tam do 
            read(M[i,j]);
end;

procedure ordena_matriz(var M: matriz; tam: integer);
var
    i, j, k, l, min_i, min_j, temp: integer;
begin
    for i := 1 to tam do 
    begin
        for j := 1 to tam do 
        begin
            min_i := i;
            min_j := j;

            k := i;
            while k <= tam do 
            begin
                l := 1;
                if k = i then
                    l := j + 1;

                while l <= tam do 
                begin
                    if M[k, l] < M[min_i, min_j] then
                    begin
                        min_i := k;
                        min_j := l;
                    end;
                    l := l + 1;
                end;
                k := k + 1;
            end;

            temp := M[i, j];
            M[i, j] := M[min_i, min_j];
            M[min_i, min_j] := temp;
        end;
    end;
end;

procedure merge_matriz(var M1, M2, M3: matriz; tam: integer);
var 
    i, j : integer;
begin
    for i := 1 to tam do 
        for j := 1 to tam do 
            M3[i,j] := M1[i,j];
    
    for i := 1 to tam do
        for j := 1 to tam do 
            M3[i,j + tam] := M2[i,j];
end;

procedure imprime_matriz(var M: matriz; tam: integer);
var
    i,j : integer;
begin
    for i := 1 to tam do 
    begin   
        for j := 1 to tam * 2 do 
            write(M[i,j], ' ');
        writeln;
    end;
end;

begin
    read(tam_m);
    ler_matriz(M1,tam_m);
    ler_matriz(M2,tam_m);
    ordena_matriz(M1,tam_m);
    ordena_matriz(M2,tam_m);
    merge_matriz(M1,M2,M3,tam_m);
    ordena_matriz(M3,tam_m);
    imprime_matriz(M3,tam_m);
end.