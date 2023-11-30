program exercicio_aquecimento2;

type matriz = array[1..100,1..100] of integer;

var 
    M: matriz;
    tam: integer;
    eh : boolean;

procedure ler_matriz(var M: matriz; tam: integer);
var
    i, j: integer;
begin
    for i := 1 to tam do 
        for j := 1 to tam do 
            read(M[i,j]);
end;

function permutacao(var M: matriz; tam: integer):boolean;
var
    i, j , somaL,somaC: integer;
    teste : boolean;
begin
    teste := true;
    for i := 1 to tam do 
    begin
        somaL := 0;
        somaC := 0;
        for j := 1 to tam do
        begin
            if (M[i,j] <> 0) and (M[i,j] <> 1) then
                teste := false;
            somaL := somaL + M[i,j];
            somaC := somaC + M[j,i];
        end;
        if (somaL <> 1) or (somaC <> 1) then
            teste := false;
    end;
    permutacao := teste;
end;

begin
    read(tam);
    ler_matriz(M,tam);

    eh := permutacao(M,tam);

    if eh then
        write('sim')
    else
        write('nao');
end.