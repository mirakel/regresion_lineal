clear all;
close all;
clc;
data = load('univariate_data.txt'); %cargando los datos
x = data(:, 1); y = data(:, 2); %asignando los valores para x e y

x = (x - min(x)) / ( max(x) - min(x) ); % Normalizando para obtener valores entre 0 y 1
size(x)
size(y)

max_iter = 1000;
alpha = 0.5;

valores_alpha = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1, 1.3, 2, 3]; %probar con estos valores de alfa

gradient_descent(x, y,alpha, max_iter); %algoritmo gradient_descent(x,y,alpha,max_iter);


