program jamal;

type 
    vetor = array[1..100] of integer;
    matriz = array[1..100] of vetor;

var 
    A: matriz;
    V: vetor;
    tam_lin, tam_col, lin_x,col_y, tam_v : integer;
    resultado : boolean;

procedure ler_matriz(var A: matriz; lin,col: integer);
var 
    i , j : integer;
begin
    for i := 1 to lin do 
        for j := 1 to col do 
            read(A[i,j]);
end;

procedure ler_vetor(var V: vetor; tam: integer);
var
    i : integer;
begin
    for i := 1 to tam do 
        read(V[i]);
end;

function procura_horizontal_direita(var A: matriz; var V: vetor; tam_lin, tam_col, tam_v, lin_x, col_y: integer):boolean;
var
    i, j, k : integer;
    encontrou : boolean; 
begin
    encontrou := false;

    i := 1;

    while (i <= tam_lin) and not encontrou do
    begin
        j := col_y;
        k := 1;

        while (j <= tam_col) and (k <= tam_v) and (A[i,j] = V[k]) do 
        begin
            j := j + 1;
            k := k + 1;
        end;

        if k > tam_v then
            encontrou := true
        else
            i := i + 1;
    end;
    procura_horizontal_direita := encontrou;
end;

function procura_horizontal_esquerda(var A: matriz; var V: vetor; tam_lin, tam_col, tam_v, lin_x, col_y: integer):boolean;
var
  i, j, k : integer;
  encontrou : boolean;  
begin
    encontrou := false;

    i := 1;

    while (i <= tam_lin) and not encontrou do
    begin
        j := col_y;
        k := 1;

        while (j >= 1) and (k <= tam_v) and (A[i,j] = V[k]) do
        begin
            j := j - 1;
            k := k + 1;
        end;

        if k > tam_v then 
            encontrou := true
        else
            i := i + 1;

    end;
    procura_horizontal_esquerda := encontrou;
end;

function procura_vertical_cima(var A: matriz; var V: vetor; tam_lin, tam_col, tam_v, lin_x, col_y: integer):boolean;
var
    i, j, k : integer;
    encontrou : boolean;
begin
    encontrou := false;
    
    j := col_y;

    while (j <= tam_col) and not encontrou do 
    begin
        i := lin_x;
        k := 1; 

        while (i <= tam_lin) and (k <= tam_v) and (A[i,j] = V[k]) do 
        begin
            i := i + 1;
            k := k + 1;
        end;

        if k > tam_v then 
            encontrou := true
        else
            j := j + 1;
    end;
    procura_vertical_cima := encontrou;
end;

function procura_vertical_baixo(var A: matriz; var V: vetor; tam_lin, tam_col, tam_v, lin_x, col_y: integer):boolean;
var
    i, j, k : integer;
    encontrou : boolean;
begin
    encontrou := false;

    j := col_y;

    while (j <= tam_col) and not encontrou do 
    begin
        i := lin_x;
        k := 1;

        while (i >= 1) and (k <= tam_v) and (A[i,j] = V[k]) do
        begin
            i := i - 1;
            k := k + 1;
        end;

        if k > tam_v then
            encontrou := true
        else
            j := j + 1;
    end;
    procura_vertical_baixo := encontrou
end;

function hunting_words(var A: matriz; var V: vetor; tam_lin, tam_col, tam_v, lin_x, col_y: integer):boolean;
begin
    hunting_words := procura_horizontal_direita(A,V,tam_lin,tam_col,tam_v,lin_x,col_y) or procura_horizontal_esquerda(A,V,tam_lin,tam_col,tam_v,lin_x,col_y) or procura_vertical_baixo(A,V,tam_lin,tam_col,tam_v,lin_x,col_y) or procura_vertical_cima(A,V,tam_lin,tam_col,tam_v,lin_x,col_y);
end;  
begin
    write('tamanho da matriz: ');
    read(tam_lin,tam_col);
    ler_matriz(A,tam_lin,tam_col);

    write('tamanho do vetor: ');
    read(tam_v);
    ler_vetor(V,tam_v);

    write('coordenadas: ');
    read(lin_x,col_y);

    writeln;
    resultado := hunting_words(A,V,tam_lin,tam_col,tam_v,lin_x,col_y);
    if resultado then
        write('sim')
    else
        write('nao');
end.
