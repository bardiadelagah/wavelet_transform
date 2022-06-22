# wavelet_transform

This code remove noise with using Wavelet Transform and medfilt2.

## How it works

The HW09_1.m read image and add salt and pepper noise.

```matlab
clc; close all; clear all;

img = imread('1.jpg');

if length(size(img))==3
    img = rgb2gray(img);
end
var = 0.05;
img_noise = imnoise(img,'salt & pepper', var);

figure(1),
subplot(1,2,1),imshow(img)
subplot(1,2,2),imshow(img_noise)
```

orginal image             |  noised image
:-------------------------:|:-------------------------:
![](https://github.com/bardiadelagah/wavelet_transform/blob/main/HW09_1/original_image.jpg)  |  ![](https://github.com/bardiadelagah/wavelet_transform/blob/main/HW09_1/noised_img.jpg)

Then we apply Wavelet Transform with 'sym4' as symlet to the noised image and get CA, CV, CH, and CD as output. Now we apply two middle filter with kernel
size 3 and 9 to CA, CV, CH, and CD for remove the noised.

```matlab
med_window1 = [3,3];
med_window2 = [9,9];

img_med1 = medfilt2(img_noise,med_window1);
img_med2 = medfilt2(img_noise,med_window2);

figure(2),
subplot(1,2,1),imshow(img_med1)
subplot(1,2,2),imshow(img_med2)

wn = 'sym4';
[CA_org, CV_org, CH_org, CD_org] = dwt2(img,wn);
[CA, CV, CH, CD] = dwt2(img_noise,wn);

ca_med1 = medfilt2(CA,med_window1);
cv_med1 = medfilt2(CV,med_window1);
ch_med1 = medfilt2(CH,med_window1);
cd_med1 = medfilt2(CD,med_window1);

ca_med2 = medfilt2(CA,med_window2);
cv_med2 = medfilt2(CV,med_window2);
ch_med2 = medfilt2(CH,med_window2);
cd_med2 = medfilt2(CD,med_window2);

```

Then we apply reconstuction wavelet to make new image form CA, CV, CH and CD.

```matlab
re_img_med1 = idwt2(ca_med1, cv_med1, ch_med1, cd_med1, wn);
re_img_med1 = uint8(re_img_med1);
re_img_med2 = idwt2(ca_med2, cv_med2, ch_med2, cd_med2, wn);
re_img_med2 = uint8(re_img_med2);
```

you can the difrenece between  apply medfilt2 to wavelet Transform output and apply medfilt2 to noised image.

metfilt2 using 3 as kernel size            |  metfilt2 using 9 as kernel size 
:-------------------------:|:-------------------------:
![](https://github.com/bardiadelagah/wavelet_transform/blob/main/HW09_1/noised_img_med1.jpg)  |  ![](https://github.com/bardiadelagah/wavelet_transform/blob/main/HW09_1/noised_img_med2.jpg)

reconstuction wavelet with metfilt2 using 3 as kernel size             |  reconstuction wavelet with metfilt2 using 9 as kernel size 
:-------------------------:|:-------------------------:
![](https://github.com/bardiadelagah/wavelet_transform/blob/main/HW09_1/final_img_med1.jpg)  |  ![](https://github.com/bardiadelagah/wavelet_transform/blob/main/HW09_1/final_img_med2.jpg)

## Donate us
If you like our project and it's useful, feel free to donate us.

Bitcoin(BTC): bc1qs2fatdfdvc5jyq4a0f5t7plmy8sxmyk08tq5e5

Ethereum(ETH): 0x5847D46Bfed82a475ef4187cfBD55EF412C05093

Tether(USDT-TRC20): TAmbZwJXDZ8bo2hjGXtNkTSEYi8dt2Xww8

XRP(XRP): rqTpCtGtBEhcPjZLXfNTv3JbCdkRKGLCF

Dogecoin(DOGE): DGZYMS6nnT3cBYwDtSD7VVubr1dSfykURC

TRON(TRX): TAmbZwJXDZ8bo2hjGXtNkTSEYi8dt2Xww8

BitTorrent-New(BTT-BEP20): 0x5847D46Bfed82a475ef4187cfBD55EF412C05093

Decentraland(MANA-ERC20): 0x5847D46Bfed82a475ef4187cfBD55EF412C05093


