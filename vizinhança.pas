program vizinhos;

type
    matriz = array[1..100, 1..100] of integer;

var
    M: matriz;
    lin, col, raio, resultado, num_lin, num_col: integer;

procedure ler_matriz(var M: matriz; lin, col: integer);
var
    i, j: integer;
begin
    for i := 1 to lin do
        for j := 1 to col do
            read(M[i, j]);
end;

procedure imprime_matriz(var M: matriz; lin, col: integer);
var
    i, j: integer;
begin
    for i := 1 to lin do
    begin
        for j := 1 to col do
            write(M[i, j], ' ');
        writeln;
    end;
end;

function soma_vizinhos(var M: matriz; lin, col, num_lin, num_col, raio: integer): integer;
var
    lin_ini, lin_fim, col_ini, col_fim, i, j, soma: integer;
begin
    soma := 0;

    lin_ini := num_lin - raio;
    if lin_ini < 1 then
        lin_ini := 1;
    lin_fim := num_lin + raio;
    if lin_fim > lin then
        lin_fim := lin;

    col_ini := num_col - raio;
    if col_ini < 1 then
        col_ini := 1;
    col_fim := num_col + raio;
    if col_fim > col then
        col_fim := col;

    for i := lin_ini to lin_fim do
        for j := col_ini to col_fim do
            soma := soma + M[i, j];

    soma := soma - M[num_lin, num_col];

    soma_vizinhos := soma;
end;

begin
    read(lin, col);
    ler_matriz(M, lin, col);

    writeln('Digite o raio: ');
    read(raio);

    writeln('Digite a posição do elemento: ');
    read(num_lin, num_col);

    resultado := soma_vizinhos(M, lin, col, num_lin, num_col, raio);
    writeln('Soma dos vizinhos = ', resultado);
end.
