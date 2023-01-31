-module(openapi_opa_decision_log).

-export([encode/1]).

-export_type([openapi_opa_decision_log/0]).

-type openapi_opa_decision_log() ::
    #{ 'decision_id' := openapi_u_uid:openapi_u_uid(),
       'labels' := openapi_labels:openapi_labels(),
       'run_id' => openapi_u_uid:openapi_u_uid(),
       'timestamp' := openapi_date_time:openapi_date_time(),
       'path' => binary(),
       'input' => maps:map(),
       'result' => maps:map()
     }.

encode(#{ 'decision_id' := DecisionId,
          'labels' := Labels,
          'run_id' := RunId,
          'timestamp' := Timestamp,
          'path' := Path,
          'input' := Input,
          'result' := Result
        }) ->
    #{ 'decision_id' => DecisionId,
       'labels' => Labels,
       'run_id' => RunId,
       'timestamp' => Timestamp,
       'path' => Path,
       'input' => Input,
       'result' => Result
     }.
