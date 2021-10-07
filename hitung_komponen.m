function [hitung, komponena] = hitung_komponenaaa(matriks_sisi, banyak_titik)
banyak_sisi = size(matriks_sisi,1); hitung_komponen = banyak_titik; komponen = zeros(1, banyak_titik);
for i=1:banyak_titik
    komponen(i) = i;
end
matriks=[];
j=1;
for sisi = 1:banyak_sisi
    ujung_kiri = matriks_sisi(sisi,1); ujung_kanan = matriks_sisi(sisi,2);
    if komponen(ujung_kiri) ~= komponen(ujung_kanan)
        hitung_komponen =  hitung_komponen-1;
        mini = (ujung_kiri); maxi=(ujung_kanan);
        if mini > (ujung_kanan)
            mini = (ujung_kanan);
            maxi = (ujung_kiri);
        end
        komponen(maxi) = komponen(mini);
        for i = 1:banyak_titik
            if komponen(i) == maxi
                komponen(i) = komponen(mini);
            end
        end
        matriks(j,:) = [ujung_kiri, ujung_kanan];
        j=j+1;
        
    end
end
if(hitung_komponen ~= 1)
    disp('graf tidak terhubung')
    komponena = komponen;
else komponena = matriks;
end
hitung = hitung_komponen; 