clc; clear; % Svuota la memoria e la command window per evitare casini

% --- 1. INPUT ---
n = input('mettimi gli anni bitch = ');
A_val = input('metti pagamento uguale A = '); % L'ho chiamata A_val per non confonderla
i = input('metti tasso interesse i = ');

% --- 2. FORMULE (Giuste!) ---
F = A_val * (((1+i)^n) - 1) / (i);
P = F / ((1+i)^n);

% Stampiamo a schermo F e P per controllo
fprintf('Il Futuro (F) è: %.2f\n', F);
fprintf('Il Presente (P) è: %.2f\n', P);

% --- 3. COSTRUZIONE VETTORI LUNGHI UGUALI ---
% Il tempo X parte dall'anno 0 e arriva all'anno n. (Quindi se n=5, ha 6 elementi)
x = 0 : 1 : n; 

% Prepariamo la Y (i flussi) con tanti zeri quanti sono gli anni
y = zeros(1, length(x)); 

% All'anno 0 (che per MATLAB è l'indice 1), ci mettiamo P (positivo come avevi fatto tu)
y(1) = P;

% Dal primo anno fino all'anno n, ci mettiamo le tue rate A (negative come nel tuo script)
for anni = 1 : n
    y(anni + 1) = -A_val;
end

% --- 4. GRAFICO ---
% Sintassi corretta di stem: prima 'filled', POI le specifiche della linea
stem(x, y, 'filled', 'LineWidth', 2, 'Color', 'b');

% Abbellimenti per farlo sembrare un grafico serio di economia
grid on;
yline(0, 'k', 'LineWidth', 1.5); % Linea nera per lo zero
title('Diagramma dei Flussi di Cassa');
xlabel('Anni');
ylabel('Importo (€)');
xticks(0:n); % Forza i numeretti degli anni esatti sull'asse X