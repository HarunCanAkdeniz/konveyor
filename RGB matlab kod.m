%imaqreset;
%clc;
%clear all;
delete(instrfindall);

a = arduino('com3');                    %arduino bilgisayara baðlý olduðu komportu seçtim

servoAttach(a,2);                       
servoAttach(a,3);
servoAttach(a,4);                       %motorlarýn baglý oldugu pinleri Attach fonk kullanarak aktif ettik
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,2,90);
servoWrite(a,3,50);
servoWrite(a,4,140);			%baþlangýç motor deðerinin Write comutu ile atadýk
servoWrite(a,5,30);
servoWrite(a,6,90);

vid = videoinput('winvideo','USB Camera');   %kameradan gelen eriyi vid e atadýk
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb');
vid.FrameGrabInterval = 2;
start(vid);
while(vid.FramesAcquired<=2000)

    data=getsnapshot(vid);
    diff_im = imsubtract(data(:,:,1), rgb2gray(data)); %resimimizin yani datamýzýn sadece r yani kýrmýzý rengini gray formatýna çekikt
    diff_im1 = imsubtract(data(:,:,2), rgb2gray(data)); %resimimizin yani datamýzýn sadece g yani yeþil rengini gray formatýna çekikt
    diff_im2 = imsubtract(data(:,:,3), rgb2gray(data));  %resimimizin yani datamýzýn sadece b yani mavi  rengini gray formatýna çekikt
    
    diff_im = medfilt2(diff_im, [3 3]); %diff_im yani kýrmýz kýsmýný 3 e 3 kernel ile medianýný aldýk
    diff_im1 = medfilt2(diff_im1, [3 3]); %diff_im1 yani yeþil kýsmýný 3 e 3 kernel ile medianýný aldýk
    diff_im2 = medfilt2(diff_im2, [3 3]);%diff_im1 yani mavi kýsmýný 3 e 3 kernel ile medianýný aldýk

    diff_im = im2bw(diff_im,0.3); %binary formata çektik resimlerimizi yoðunluk 0.3
    diff_im1 = im2bw(diff_im1,0.1); %binary formata çektik resimlerimizi yoðunluk 0.3
    diff_im2 = im2bw(diff_im2,0.3); %binary formata çektik resimlerimizi yoðunluk 0.3
    
    
    diff_im = bwareaopen(diff_im,200);  %bwareaopen: binary modda küçük parçalarý(baðlý olmayan) yok eder. aþýndýrma iþleminin benzeridir.
    diff_im1 = bwareaopen(diff_im1,200);%bwareaopen: binary modda küçük parçalarý(baðlý olmayan) yok eder. aþýndýrma iþleminin benzeridir.
    diff_im2 = bwareaopen(diff_im2,200);%bwareaopen: binary modda küçük parçalarý(baðlý olmayan) yok eder. aþýndýrma iþleminin benzeridir.
    
    bw = bwlabel(diff_im, 4);
    bw1 = bwlabel(diff_im1, 4);
    bw2 = bwlabel(diff_im2, 4);

imshow(data,'Border','tight','InitialMagnification', 255);
hold on
toplam=sum(sum(bw));%KIRMIZI
if (toplam>20)   %filtre uyguladýðýmýz kýrýmýzý deðer için 20 den büyükse kýrmýzý kýsma aþaðýdaki servo koutlarý ile yönlendirme yaptýk 
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
    %BIRAKTI BAÞLANGIÇ POZ DÖNÜYOR
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
toplam=sum(sum(bw1));%YEÞÝL
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
    %BIRAKTI BAÞLANGIÇ POZ DÖNÜYOR
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
if (toplam>20)   %filtre uyguladýðýmýz mavi deðer için 20 den büyükse kýrmýzý kýsma aþaðýdaki servo koutlarý ile yönlendirme yaptýk 
    pause(1);  % asagýda mavi kutunun konmasý gereken yere yonlendirdik ve geri getirdik
    
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
    %BIRAKTI BAÞLANGIÇ POZ DÖNÜYOR
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