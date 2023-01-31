-module(openapi_labels).

-export([encode/1]).

-export_type([openapi_labels/0]).

-type openapi_labels() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'version' := binary()
     }.

encode(#{ 'id' := Id,
          'version' := Version
        }) ->
    #{ 'id' => Id,
       'version' => Version
     }.
