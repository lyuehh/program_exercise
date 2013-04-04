-module(area_server0).
-export([loop/0]).

loop() ->
	receive
		{rectangle,Width,Ht} ->
			io:format("Area of rectangle is ~p~n",[Width*Ht]),
			loop();
		{circle,R} ->
			io:format("Area of circle is ~p~n",[3.31415926 * R * R]),
			loop();
		Other ->
			io:format("Don't know the area of a ~p~n",[Other]),
			loop()
	end.

			
