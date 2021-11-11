function [accuracy,w,b] = pocket(X, y, learning_rate, epochs)
    [veri_sayisi,input_size] = size(X);
    w = 2 * rand(input_size, 1) - 1;
    b=0;
    accuracy = 0;
    
    for i=1:epochs
        
        r = randi(veri_sayisi, 1);
        y_tahmin = sign(X(r, :)*w+b);
        d=0;
        while(y_tahmin==y(r))
            r = randi(size(X, 1), 1);
            y_tahmin = sign(X(r, :)*w+b);
        end
        
        w_tmp = w + (learning_rate * y(r) * X(r,:))';
        b_tmp = b + learning_rate * y(r);
        
        y_toplam_tahmin = sign(X*w_tmp+b_tmp);
        
        y_dogru_tahmin_sayisi = false(1,veri_sayisi);
        y_dogru_tahmin_sayisi=(y_toplam_tahmin==y);
        y_dogru_tahmin_sayisi = sum(y_dogru_tahmin_sayisi);
        
        if (y_dogru_tahmin_sayisi > accuracy)
                accuracy = y_dogru_tahmin_sayisi;
                w = w_tmp;
                b = b_tmp;
        end
    end
end



