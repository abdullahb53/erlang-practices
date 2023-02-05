-module(monitors).

-compile(export_all).

-define(TIMEOUT, 3000).

worker() ->
  receive
    do_work ->
      io:format("~n[DO_WORK]I am a worker, my pid is: ~p",[self()]),
      worker()
  after ?TIMEOUT ->
    io:format("~n[WILL DYING AFTER]I am a worker that have no work, my pid is: ~p ",[self()]),
    exit(no_activity)
  end.

parent() ->
  Pid = spawn(monitors,worker,[]),
  register(worker, Pid),
  Ref = erlang:monitor(process, Pid),

  io:format("~n[PARENT]I have a new worker, his pid is: ~p",[Pid]),
  receive {'DOWN',Ref,process,Pid,Reason} ->
    io:format("~n[DOWN DETECT FORM MONITOR] my worker died -> ~p reason: ~p",[Pid,Reason]),
    parent()

  end.

loop() ->
  receive
    {new_worker, WorkerPid} ->
      timer:sleep(?TIMEOUT-2000),
      WorkerPid ! do_work,
      loop()
  end.

start() ->
  Pid = spawn(monitors, loop,[]),
  register(?MODULE,Pid),

  ParentPid = spawn(monitors, parent, []),
  register(parent, ParentPid),

  Ref = erlang:monitor(process, Pid),
  erlang:demonitor(Ref),

  timer:sleep(round(?TIMEOUT*1.5)),
  exit(whereis(worker), finished),
  exit(whereis(parent), finished),
  exit(whereis(?MODULE), finished),
  ok.


