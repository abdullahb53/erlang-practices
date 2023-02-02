-module(records).
-include("records.hrl").


-export([included/0]).

included() -> #included{some_field="Some value"}.