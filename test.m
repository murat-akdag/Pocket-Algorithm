clc;
clear all;
    
veriseti = xlsread('Cryotherapy.xlsx');
giris=veriseti(:,1:6);
cikis=veriseti(:,7);
giris=normalize(giris,'range');


giris_veri=giris(1:60,:);
test_veri=giris(61:90,:);

cikis_veri=cikis(1:60,1);
cikis_test=cikis(61:90,1);
   

epochs=1000000;
learning_rate=0.8;

    %fonksiyon
    
[result,w,b] = pocket(giris_veri, cikis_veri, learning_rate, epochs)
 
   %% y_tahmin = sign(test_veri(6, :)*w +b)
