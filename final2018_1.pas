program jamal;

CONST MAX = 200;
Type tpMatriz = array[1..MAX,1..MAX] of integer;

var 
    N: integer;
    Matriz, MatrizFiltrada, MatrizNucleo: tpMatriz;

procedure ler_matriz(Var M: tpMatriz; N: integer);
var 
    i, j : integer;
begin
    for i := 1 to N do 
        for j := 1 to N do 
            read(M[i,j]);
end;

procedure imprimir_matriz(var M: tpMatriz; N: integer);
var
    i, j : integer;
begin
    for i := 1 to N do 
    begin
        for j := 1 to N do 
            write(M[i,j]);
        writeln;
    end;
end;

function aplicar_filtro_no_pixel(var M, K: tpMatriz; N, x, y: integer):integer;
var
    i, j , soma: integer;
begin
    soma := 0;
    for i := x - 1 to x + 1 do 
        for j := y - 1 to y + 1 do 
            soma := soma + M[i,j] * K[i - x + 2, j - y + 2];
    aplicar_filtro_no_pixel := soma;
end;

procedure aplicar_filtro(var M, K, R: tpMatriz; N: integer);
var
    i, j: integer;
begin
    for i:= 2 to N - 1 do 
        for j := 2 to N - 1 do 
            R[i,j] := aplicar_filtro_no_pixel(M,K,N,i,j);
end;

begin
    writeln('Digite o tamanho da matriz: ');
    read(N);

    writeln('Digite a matriz ', N, 'x', N, ':'):
    ler_matriz(Matriz,N);

    writeln('Digite a matriz nucle 3x3: ');
    ler_matriz(MatrizNucleo,3);

    aplicar_filtro(Matriz,MatrizNucleo,MatrizFiltrada,N);

    writeln('Matriz Original: ');
    imprimir_matriz(Matriz,N);

    writeln('Matriz filtrada: ');
    imprimir_matriz(MatrizFiltrada,N);
end.



