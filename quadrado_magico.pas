program quadrado_magico;

type matriz = array[1..100,1..100] of integer;

var 
    M: matriz;
    tam: integer;
    eh: boolean;

procedure ler_matriz(var M: matriz; tam: integer);
var
    i, j: integer;
begin
    for i := 1 to tam do 
        for j := 1 to tam do 
            read(M[i,j]);
end;

function quadrado_magico(var M: matriz; tam: integer):boolean;
var 
    i, j, soma_diagonalP, soma_diagonalS: integer;
    teste_quadrado: boolean;
    soma_linha, soma_coluna : array[1..100] of integer;
begin
    teste_quadrado := false;
    for i := 1 to tam do 
    begin
        soma_linha[i] := 0;
        soma_coluna[i] := 0;
    end;

    soma_diagonalP := 0;
    for i := 1 to tam do 
    begin
        soma_diagonalP := soma_diagonalP + M[i,i];
        soma_linha[i] := 0;
        for j := 1 to tam do
        begin
            soma_linha[i] := soma_linha[i] + m[i,j];
            soma_coluna[j] := soma_coluna[j] + m[i,j];
        end;
    end;

    teste_quadrado := true;
    for i := 1 to tam do 
    begin
        if (soma_linha[i] <> soma_diagonalP) or (soma_coluna[i] <> soma_diagonalP) then
            teste_quadrado := false;        
    end;

    soma_diagonalS := 0;
    for i := 1 to tam do 
        soma_diagonalS := soma_diagonalS + M[i, tam - i + 1];

    if (soma_diagonalP <> soma_diagonalS) then
        teste_quadrado := false;
    
    quadrado_magico := teste_quadrado;
end;

begin
    read(tam);
    ler_matriz(M,tam);

    eh := quadrado_magico(M,tam);
    
    if eh then
        write('sim')
    else
        write('nao');
end.