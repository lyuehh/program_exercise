-module(shop1).
-export([total/1]).

total([{What,N}|T]) -> shop:cost(What) * N + total(T); %% ��Сд���ܴ�
total([])           -> 0.