program jamal;

type    
    vetor = array[1..100] of integer;
    matriz = array[1..100] of vetor;

var
    A: matriz; 
    itinerario: vetor;
    tam_it, tam_A, resultado: integer;

procedure ler_matriz(var A: matriz; tam: integer);
var
    i,j : integer;
begin
    for i := 1 to tam do 
        for j := 1 to tam do 
            read(A[i,j]);
end;

procedure ler_itinerario(var V: vetor; tam : integer);
var
    i: integer;
begin
    for i := 1 to tam do 
        read(V[i]); 
end;

function soma_itinerario(var A: matriz;var itinerario: vetor;tam_itinerario : integer):integer;
var 
    i, soma_total: integer;
begin
    soma_total := 0;

    for i := 1 to tam_itinerario - 1 do 
        soma_total := soma_total + A[itinerario[i],itinerario[i + 1]];
    
    soma_itinerario := soma_total;
end;

begin
    read(tam_A);
    ler_matriz(A,tam_A);

    read(tam_it);
    ler_itinerario(itinerario,tam_it);

    resultado := soma_itinerario(A,itinerario,tam_it);
    writeln(resultado);
end.