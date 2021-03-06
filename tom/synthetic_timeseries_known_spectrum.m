%[yfilt]=synthestic_timeseries_known_spectrum(N,dt,alpha,beta);
%
%Produce a random realization of a time series with a given
%  power-law spectrum, S=alpha*freq^Beta.
%
%Inputs:
%  N, number of points; if 2 elements, N = [number-of-time-instants number-of-timeseries]
%  dt, sampling interval (in desired units)
%  alpha, multiplicative scaling factor for spectrum (S=alpha*freq^Beta)
%  Beta, power-law dependence, such that spectrum is proportional to freq^-Beta
%
%Output:
%  yfilt, a  time series with the specified power-law dependence
%
%
% This function is derived from synthestic_timeseries.m, which had a unit-variance output
% time series.  Here, the time series variance is whatever is implied by the spectrum
%
% Started 10/72016
% Tom Farrar, jfarrar@whoi.edu
%


function [yfilt]=synthetic_timeseries_known_spectrum(N,dt,alpha,beta);

if length(N) > 1
    y = randn(N);
else
    y=randn(N,1);
end

[Y,freq]=centeredFFT(y,dt);
T=N.*dt;

freq = repmat(freq', [1 size(y, 2)]);
%Yfilt=sqrt(alpha).*N./sqrt(2.*T).*abs(freq').^(beta./2).*Y;
%Yfilt=sqrt(alpha).*sqrt(N./(2.*dt)).*abs(freq').^(beta./2).*Y;
Yfilt=sqrt(alpha).*sqrt(1./(2.*dt)).*abs(freq).^(beta./2).*Y;
%Yfilt=sqrt(alpha).*abs(freq').^(beta./2).*Y;

ff=find(freq(:,1)==0);
Yfilt(ff,:)=0;
Yfilt2=ifftshift(Yfilt, 1);
yfilt=ifft(Yfilt2, [], 1);

%Lines below confirm that fftshift, fft, and inverses all work as expected and give original noise timeseries:
%Ytest=ifftshift(Y);
%ytest=ifft(Ytest);
%max_ytest_error=max(y-ytest)
