-module(shop1).
-export([total/1]).

total([{What,N}|T]) -> shop:cost(What) * N + total(T); %% 大小写不能错
total([])           -> 0.