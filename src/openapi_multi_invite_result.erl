-module(openapi_multi_invite_result).

-export([encode/1]).

-export_type([openapi_multi_invite_result/0]).

-type openapi_multi_invite_result() ::
    #{ 'success' := list(),
       'failed' => list()
     }.

encode(#{ 'success' := Success,
          'failed' := Failed
        }) ->
    #{ 'success' => Success,
       'failed' => Failed
     }.
