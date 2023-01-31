-module(openapi_opa_metrics).

-export([encode/1]).

-export_type([openapi_opa_metrics/0]).

-type openapi_opa_metrics() ::
    #{ 'timer_rego_input_parse_ns' => integer(),
       'timer_rego_query_parse_ns' => integer(),
       'timer_rego_query_compile_ns' => integer(),
       'timer_rego_query_eval_ns' => integer(),
       'timer_rego_module_parse_ns' => integer(),
       'timer_rego_module_compile_ns' => integer(),
       'timer_server_handler_ns' => integer()
     }.

encode(#{ 'timer_rego_input_parse_ns' := TimerRegoInputParseNs,
          'timer_rego_query_parse_ns' := TimerRegoQueryParseNs,
          'timer_rego_query_compile_ns' := TimerRegoQueryCompileNs,
          'timer_rego_query_eval_ns' := TimerRegoQueryEvalNs,
          'timer_rego_module_parse_ns' := TimerRegoModuleParseNs,
          'timer_rego_module_compile_ns' := TimerRegoModuleCompileNs,
          'timer_server_handler_ns' := TimerServerHandlerNs
        }) ->
    #{ 'timer_rego_input_parse_ns' => TimerRegoInputParseNs,
       'timer_rego_query_parse_ns' => TimerRegoQueryParseNs,
       'timer_rego_query_compile_ns' => TimerRegoQueryCompileNs,
       'timer_rego_query_eval_ns' => TimerRegoQueryEvalNs,
       'timer_rego_module_parse_ns' => TimerRegoModuleParseNs,
       'timer_rego_module_compile_ns' => TimerRegoModuleCompileNs,
       'timer_server_handler_ns' => TimerServerHandlerNs
     }.
