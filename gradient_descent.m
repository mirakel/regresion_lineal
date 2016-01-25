function gradient_descent(x, y, alpha, max_iter)
    m = length(x); % numero de datos de entrenamiento
    
    %Para la hipotesis: h_theta = theta_0 + theta_1 * x.
    theta_0 = 0;  
    theta_1 = 0;
    
    %historial_J para almacenar el valor de la Función Costo.
    historial_J = zeros(1,max_iter);
    h = 1;
    
    for iter = 1:max_iter
        % Variables auxiliares donde se almacena el valor de las derivadas parciales de la funcion costo.
        sum_0 = 0; sum_1 = 0; sum_c = 0;
        
        for i = 1:m
            h_theta = theta_0  + theta_1 * x(i);
            sum_0 = sum_0 + ( h_theta - y(i) );
            sum_1 = sum_1 + ( ( h_theta - y(i) ) * x(i) ); 
            
            %Para la Funcion costo
            sum_c = sum_c + ( h_theta - y(i) )^2;            
        end
        
        historial_J(h) = ( 1.0 /2 * m ) * sum_c;
        h = h + 1;
        
        % Actualizacion simultanea de los parametros theta_0 y theta_1
        theta_0 = theta_0 - alpha * ( 1.0 / m ) * sum_0;
        theta_1 = theta_1 - alpha * ( 1.0 / m ) * sum_1;
    end
    
    %grafica del resultado
    plot(x, y, '*');
    hold on;
    h_y = theta_0 + theta_1 * x;
    plot(x, h_y, 'g');
    
    %grafica de la funcion costo
    x = 1:max_iter;
    plot(x,historial_J, 'r');
    
    