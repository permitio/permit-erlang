-module(openapi_dummy_engine_model).

-export([encode/1]).

-export_type([openapi_dummy_engine_model/0]).

-type openapi_dummy_engine_model() ::
    #{ 'engine' => openapi_engine:openapi_engine(),
       'timestamp' => openapi_date_time:openapi_date_time()
     }.

encode(#{ 'engine' := Engine,
          'timestamp' := Timestamp
        }) ->
    #{ 'engine' => Engine,
       'timestamp' => Timestamp
     }.
