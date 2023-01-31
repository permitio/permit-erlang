-module(openapi_opa_engine_decision_log).

-export([encode/1]).

-export_type([openapi_opa_engine_decision_log/0]).

-type openapi_opa_engine_decision_log() ::
    #{ 'engine' => binary(),
       'decision_id' := openapi_u_uid:openapi_u_uid(),
       'labels' := openapi_o_pa_labels:openapi_o_pa_labels(),
       'timestamp' := openapi_date_time:openapi_date_time(),
       'path' := binary(),
       'input' => openapi_any_type:openapi_any_type(),
       'result' => openapi_any_type:openapi_any_type(),
       'metrics' := openapi_o_pa_metrics:openapi_o_pa_metrics()
     }.

encode(#{ 'engine' := Engine,
          'decision_id' := DecisionId,
          'labels' := Labels,
          'timestamp' := Timestamp,
          'path' := Path,
          'input' := Input,
          'result' := Result,
          'metrics' := Metrics
        }) ->
    #{ 'engine' => Engine,
       'decision_id' => DecisionId,
       'labels' => Labels,
       'timestamp' => Timestamp,
       'path' => Path,
       'input' => Input,
       'result' => Result,
       'metrics' => Metrics
     }.
