program prova;

type matriz = array[1..100,1..100] of integer;

var 
    M1,MP: matriz;
    tam, passo: integer;

procedure ler_matriz(var M: matriz; tam: integer);
var
    i, j : integer;
begin
    for i := 1 to tam do 
        for j := 1 to tam do 
            read(M[i,j]);
end;

procedure imprimir_matriz(var M: matriz; var tam: integer; passo: integer);
var 
    i, j : integer;
begin
    for i := 1 to tam div passo do 
    begin
        for j := 1 to tam div passo do 
            write(M[i,j], ' ');
        writeln;
    end;
end;

procedure maxpolling(var matriz_original, matriz_polling: matriz; tam, passo: integer);
var
    i, j, x, y, max: integer;
begin
    x := 1;
    for i := 1 to tam div passo do 
    begin
        y := 1;
        for j := 1 to tam div passo do
        begin
            max := matriz_original[(i - 1) * passo + 1, (j - 1) * passo + 1];
            for x := x to x + passo - 1 do 
                for y := y to y + passo - 1 do
                begin
                    if matriz_original[x,y] > max then
                        max := matriz_original[x,y];
                end;
        matriz_polling[i,j] := max;
        y := y + passo;
        end;
    x := x + passo;
    end; 
end;

begin
    read(tam);
    read(passo);
    ler_matriz(M1,tam);
    
    maxpolling(M1,Mp,tam,passo);

    writeln;
    imprimir_matriz(MP,tam,passo);
end.