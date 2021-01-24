%imaqreset;
%clc;
%clear all;
delete(instrfindall);

a = arduino('com3');                    %arduino bilgisayara ba�l� oldu�u komportu se�tim

servoAttach(a,2);                       
servoAttach(a,3);
servoAttach(a,4);                       %motorlar�n bagl� oldugu pinleri Attach fonk kullanarak aktif ettik
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,2,90);
servoWrite(a,3,50);
servoWrite(a,4,140);			%ba�lang�� motor de�erinin Write comutu ile atad�k
servoWrite(a,5,30);
servoWrite(a,6,90);

vid = videoinput('winvideo','USB Camera');   %kameradan gelen eriyi vid e atad�k
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb');
vid.FrameGrabInterval = 2;
start(vid);
while(vid.FramesAcquired<=2000)

    data=getsnapshot(vid);
    diff_im = imsubtract(data(:,:,1), rgb2gray(data)); %resimimizin yani datam�z�n sadece r yani k�rm�z� rengini gray format�na �ekikt
    diff_im1 = imsubtract(data(:,:,2), rgb2gray(data)); %resimimizin yani datam�z�n sadece g yani ye�il rengini gray format�na �ekikt
    diff_im2 = imsubtract(data(:,:,3), rgb2gray(data));  %resimimizin yani datam�z�n sadece b yani mavi  rengini gray format�na �ekikt
    
    diff_im = medfilt2(diff_im, [3 3]); %diff_im yani k�rm�z k�sm�n� 3 e 3 kernel ile median�n� ald�k
    diff_im1 = medfilt2(diff_im1, [3 3]); %diff_im1 yani ye�il k�sm�n� 3 e 3 kernel ile median�n� ald�k
    diff_im2 = medfilt2(diff_im2, [3 3]);%diff_im1 yani mavi k�sm�n� 3 e 3 kernel ile median�n� ald�k

    diff_im = im2bw(diff_im,0.3); %binary formata �ektik resimlerimizi yo�unluk 0.3
    diff_im1 = im2bw(diff_im1,0.1); %binary formata �ektik resimlerimizi yo�unluk 0.3
    diff_im2 = im2bw(diff_im2,0.3); %binary formata �ektik resimlerimizi yo�unluk 0.3
    
    
    diff_im = bwareaopen(diff_im,200);  %bwareaopen: binary modda k���k par�alar�(ba�l� olmayan) yok eder. a��nd�rma i�leminin benzeridir.
    diff_im1 = bwareaopen(diff_im1,200);%bwareaopen: binary modda k���k par�alar�(ba�l� olmayan) yok eder. a��nd�rma i�leminin benzeridir.
    diff_im2 = bwareaopen(diff_im2,200);%bwareaopen: binary modda k���k par�alar�(ba�l� olmayan) yok eder. a��nd�rma i�leminin benzeridir.
    
    bw = bwlabel(diff_im, 4);
    bw1 = bwlabel(diff_im1, 4);
    bw2 = bwlabel(diff_im2, 4);

imshow(data,'Border','tight','InitialMagnification', 255);
hold on
toplam=sum(sum(bw));%KIRMIZI
if (toplam>20)   %filtre uygulad���m�z k�r�m�z� de�er i�in 20 den b�y�kse k�rm�z� k�sma a�a��daki servo koutlar� ile y�nlendirme yapt�k 
    pause(1);
    
servoAttach(a,2);
servoAttach(a,3);
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,2,90);
servoWrite(a,3,50);
servoWrite(a,4,140);
servoWrite(a,5,30);
servoWrite(a,6,90);

    pause(3);
    b=0.00125;
    for i=140: -1:70
        servoWrite(a,4,i);
        pause(b);
    end
    for i=90: -1:20
        servoWrite(a,2,i);
        pause(b);
    end
    for i=30:50
        servoWrite(a,5,i);
        pause(b);
    end
    for i=50:110
        servoWrite(a,3,i);
        pause(b);
    end
    for i=90:140
        servoWrite(a,6,i);
        pause(b);
    end
     %ALDIKTAN SONRASI
    for i=110: -1:50
        servoWrite(a,3,i);
        pause(b);
    end
    for i=20:90
        servoWrite(a,2,i);
        pause(b);
    end
    for i=50:110
        servoWrite(a,3,i);
        pause(b);
    end
    for i=140: -1:90
        servoWrite(a,6,i);
        pause(b);
    end
    %BIRAKTI BA�LANGI� POZ D�N�YOR
    for i=110: -1:50
        servoWrite(a,3,i);
        pause(b);
    end
    for i=70:140
        servoWrite(a,4,i);
        pause(b);
    end
    for i=50: -1:30
        servoWrite(a,5,i);
        pause(b);
    end
end
toplam=sum(sum(bw1));%YE��L
if (toplam>20)
      pause(1);
servoAttach(a,2);
servoAttach(a,3);
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,2,90);
servoWrite(a,3,50);
servoWrite(a,4,140);
servoWrite(a,5,30);
servoWrite(a,6,90);
    pause(3);
    b=0.00125;
    for i=140: -1:70
        servoWrite(a,4,i);
        pause(b);
    end
    for i=90: -1:20
        servoWrite(a,2,i);
        pause(b);
    end
    for i=30:50
        servoWrite(a,5,i);
        pause(b);
    end
    for i=50:110
        servoWrite(a,3,i);
        pause(b);
    end
    for i=90:140
        servoWrite(a,6,i);
        pause(b);
    end
     %ALDIKTAN SONRASI
    for i=110: -1:50
        servoWrite(a,3,i);
        pause(b);
    end
    for i=20:110
        servoWrite(a,2,i);
        pause(b);
    end
    for i=50:110
        servoWrite(a,3,i);
        pause(b);
    end
    for i=140: -1:90
        servoWrite(a,6,i);
        pause(b);
    end
    %BIRAKTI BA�LANGI� POZ D�N�YOR
    for i=110: -1:50
        servoWrite(a,3,i);
        pause(b);
    end
    for i=70:140
        servoWrite(a,4,i);
        pause(b);
    end
    for i=50: -1:30
        servoWrite(a,5,i);
        pause(b);
    end
    for i=110: -1:90
        servoWrite(a,2,i);
        pause(b);
    end
    
end
toplam=sum(sum(bw));%KIRMIZI
if (toplam>20)   %filtre uygulad���m�z mavi de�er i�in 20 den b�y�kse k�rm�z� k�sma a�a��daki servo koutlar� ile y�nlendirme yapt�k 
    pause(1);  % asag�da mavi kutunun konmas� gereken yere yonlendirdik ve geri getirdik
    
servoAttach(a,2);
servoAttach(a,3);
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,2,90);
servoWrite(a,3,50);
servoWrite(a,4,140);
servoWrite(a,5,30);
servoWrite(a,6,90);

    pause(3);
    b=0.00125;
    for i=140: -1:70
        servoWrite(a,4,i);
        pause(b);
    end
    for i=90: -1:20
        servoWrite(a,2,i);
        pause(b);
    end
    for i=30:50
        servoWrite(a,5,i);
        pause(b);
    end
    for i=50:110
        servoWrite(a,3,i);
        pause(b);
    end
    for i=90:140
        servoWrite(a,6,i);
        pause(b);
    end
     %ALDIKTAN SONRASI
    for i=110: -1:50
        servoWrite(a,3,i);
        pause(b);
    end
    for i=20:90
        servoWrite(a,2,i);
        pause(b);
    end
    for i=50:110
        servoWrite(a,3,i);
        pause(b);
    end
    for i=140: -1:90
        servoWrite(a,6,i);
        pause(b);
    end
    %BIRAKTI BA�LANGI� POZ D�N�YOR
    for i=110: -1:50
        servoWrite(a,3,i);
        pause(b);
    end
    for i=70:140
        servoWrite(a,4,i);
        pause(b);
    end
    for i=50: -1:30
        servoWrite(a,5,i);
        pause(b);
    end
end

end
%hold on
hold off
stop(vid);
flushdata(vid);

%imaqreset
imaqreset;
clc;
clear all;