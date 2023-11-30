program prova2019_1;

type
    vetor = array[1..100] of integer;
    matriz = array[1..100] of vetor;

var 
    V: vetor;
    M: matriz;
    tam_m, tam_v, reposta, k, i, j: integer;

procedure ler_matriz(var M: matriz; tam: integer);
var 
    i, j: integer;
begin
    for i := 1 to tam do
        for j := 1 to tam do 
            read(M[i,j]);
end;

function maior_valor(var V: vetor; tam: integer): integer;
var
    i, maior: integer;
begin
    maior := V[1];
    for i := 2 to tam do 
        if V[i] > maior then
            maior := V[i];
    maior_valor := maior;
end;

function calcular_ampulhetas(var M: matriz; tam: integer; var tam_v: integer): vetor;
var
    i, j: integer;
    ampulheta: vetor;
begin
    k := 1;
    for i := 1 to tam - 2 do
    begin
        for j := 1 to tam - 2 do 
        begin
            ampulheta[tam_v] := M[i,j] + M[i,j+1] + M[i,j+2] + M[i+1,j+1] + M[i+2,j] + M[i+2,j+1] + M[i+2,j+2];
            tam_v := tam_v + 1; 
        end;
    end;
    calcular_ampulhetas := ampulheta; 
end;

begin
    readln(tam_m);
    ler_matriz(M, tam_m);

    k := 1;
    V := calcular_ampulhetas(M, tam_m, k);
    tam_v := k - 1;
    
    reposta := maior_valor(V, tam_v);
    writeln;
    writeln(reposta);
end.