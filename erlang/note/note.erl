-module(note).
-include_lib("wx/include/wx.hrl").

-export([start/0]).
-compile(export_all).

-behaviour(wx_object).

-record(state,{win}).

start() ->
	wx_object:start_link(?MODULE,[],[{debug,[trace]}]).

init([]) ->
	wx:new(),
	Frame = wxFrame:new(wx:null(),
		-1,
		"Note",
		[{size,{600,400}}]),
	wxFrame:createStatusBar(Frame,[]),

	wxFrame:connect(Frame,close_window),

	ok = wxFrame:setStatusText(Frame,"Note for myself!",[]),
	wxFrame:show(Frame),
	{Frame,#state{win=Frame}}.

%% Handled as in normal gen_server callbacks
handle_info(Msg,State) ->
	io:format("Got Info ~p~n",[Msg]),
	{noreply,State}.

handle_call(Msg,_Form,State) ->
	io:format("Got Call ~p~n",[Msg]),
	{reply,ok,State}.

% Anyns Events are handled in handle_event as in handle_info
handle_event(#wx{event=#wxClose{}},State = #state{win=Frame}) ->
	io:format("~p Closing window ~n",[self()]),
	ok = wxFrame:setStatusText(Frame,"Closing...",[]),
	wxWindow:destroy(Frame),
	{stop,normal,State}.

code_change(_,_,State) ->
	{stop,not_yet_implemented,State}.

terminate(_Reason,_State) ->
	ok.

