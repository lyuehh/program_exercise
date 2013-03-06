#!/usr/bin/env escript

pythag(N) ->
  [{A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1,N),
    C <- lists:seq(1,N),
    A + B + C == N,
    A == B - 1,
    B == C - 1].
main(_) ->
  io:format("~p~n", [pythag(30)]).
