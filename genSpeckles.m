function [ I ] = genSpeckles( Sz, k )
%GENSPECKLES Generate speckle pattern of size Sz
%   INPUTS:
%       Sz - Size of the speckle pattern
%       k - Speckle size in pixels
if numel(Sz) == 1
    Sz = [Sz(1) Sz(1)];
end

n = max(Sz);
start = exp(2i*pi*rand(round(n/k)));
scatterArray = padarray(start,[n - round(n/k),n - round(n/k)],'post');
speckleField = fft2(scatterArray);
I = abs(speckleField).^2;

I = I(1:Sz(1),1:Sz(2));
I = I / (n/k)^2;
end

