program nulos;

type matriz = array[1..100,1..100] of integer;

var
    M: matriz; 
    lin, col, somaL, somaC: integer;

procedure ler_matriz(var M: matriz; lin,col: integer);
var
    i, j: integer;
begin
    for i := 1 to lin do 
        for j := 1 to col do 
            read(M[i,j]);
end;

function linhas_nulas(var M: matriz; lin,col: integer): integer;
var 
    i, j, soma : integer;
    teste : boolean;
begin
    soma := 0;
    for i := 1 to lin do 
    begin 
        teste := true;
        for j := 1 to col do 
            if (m[i,j] <> 0) then
                teste := false;
        if teste then
            soma := soma + 1;
    end;
    linhas_nulas := soma; 
end;

function colunas_nulas(var M: matriz; lin,col: integer): integer;
var 
    i, j, soma : integer;
    teste : boolean;
begin
    soma := 0;
    for j := 1 to col do 
    begin 
        teste := true;
        for i := 1 to lin do 
            if (m[i,j] <> 0) then
                teste := false;
        if teste then
            soma := soma + 1;
    end;
    colunas_nulas := soma; 
end;

begin
    read(lin);
    read(col);
    ler_matriz(M,lin,col);

    somaL := linhas_nulas(M,lin,col);
    somaC := colunas_nulas(M,lin,col);

    writeln('linhas: ', somaL);
    writeln('colunas: ', somaC);
end.
(*
function fornicate(var eu, var vc): Baby;
begin
    obaaa
    lero lero 
end.
*)